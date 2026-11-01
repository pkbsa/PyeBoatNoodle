const fs = require('node:fs/promises');
const path = require('node:path');
const cheerio = require('cheerio');

const root = path.join(__dirname, '..');
const slugOverrides = { 'jae-special': 'special' };

function quote(value) {
  if (value == null || value === '') return 'NULL';
  return `'${String(value).replace(/\\/g, '\\\\').replace(/'/g, "''")}'`;
}

function parsePrice(value) {
  const text = value.trim();
  const fixed = text.match(/^\$\s*(\d+(?:\.\d{1,2})?)$/);
  const modifier = text.match(/^\+\s*\$\s*(\d+(?:\.\d{1,2})?)$/);
  return {
    price: fixed ? Number(fixed[1]).toFixed(2) : null,
    priceModifier: modifier ? Number(modifier[1]).toFixed(2) : '0.00'
  };
}

async function buildSql() {
  const html = await fs.readFile(path.join(root, 'index.html'), 'utf8');
  const $ = cheerio.load(html);
  const categories = [];
  const items = [];

  $('#menu section[id^="category-"]').each((categoryIndex, element) => {
    const section = $(element);
    const sectionId = section.attr('id');
    const rawSlug = sectionId.replace(/^category-/, '');
    const slug = slugOverrides[rawSlug] || rawSlug;
    const paragraphs = section.children('p').map((_, paragraph) => $(paragraph).text().trim()).get().filter(Boolean);
    const image = $(`#menu a[href="#${sectionId}"] img`).attr('src') || '';

    categories.push({
      name: section.children('h3').first().text().trim() || rawSlug,
      slug,
      description: paragraphs[0] || null,
      menuNotes: paragraphs.slice(1).join('\n') || null,
      image,
      order: categoryIndex + 1
    });

    section.find('article').each((itemIndex, articleElement) => {
      const article = $(articleElement);
      const name = article.find('h4').first().text().trim();
      if (!name) return;
      const price = parsePrice(article.find('.font-bold').first().text());
      items.push({
        categorySlug: slug,
        name,
        description: article.find('p').first().text().trim() || null,
        price: price.price,
        priceModifier: price.priceModifier,
        image: article.find('img').first().attr('src') || null,
        order: itemIndex + 1
      });
    });
  });

  const sql = [
    '-- Generated from the menu in index.html by: node scripts/export-menu-sql.js',
    '-- Run database/schema.sql first. This seed preserves existing rows on repeat imports.',
    'START TRANSACTION;',
    '',
    'INSERT INTO menu_categories (name, slug, description, menu_notes, image_url, display_order)',
    'VALUES',
    categories.map(category => `  (${[category.name, category.slug, category.description, category.menuNotes, category.image, category.order].map(quote).join(', ')})`).join(',\n'),
    'ON DUPLICATE KEY UPDATE id = LAST_INSERT_ID(id);',
    ''
  ];

  items.forEach(item => {
    sql.push(
      `INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)`,
      `SELECT c.id, ${quote(item.name)}, ${quote(item.description)}, ${item.price ?? 'NULL'}, ${item.priceModifier}, ${quote(item.image)}, ${item.order}`,
      `FROM menu_categories AS c WHERE c.slug = ${quote(item.categorySlug)}`,
      'ON DUPLICATE KEY UPDATE id = id;',
      ''
    );
  });

  sql.push('COMMIT;', '');
  return { sql: sql.join('\n'), categoryCount: categories.length, itemCount: items.length };
}

async function main() {
  const { sql, categoryCount, itemCount } = await buildSql();
  const outputPath = path.join(root, 'database', 'menu-seed.sql');
  await fs.writeFile(outputPath, sql, 'utf8');
  console.log(`Exported ${categoryCount} categories and ${itemCount} menu items to database/menu-seed.sql`);
}

if (require.main === module) {
  main().catch(error => {
    console.error('Menu SQL export failed:', error.message);
    process.exitCode = 1;
  });
}

module.exports = { buildSql, parsePrice };