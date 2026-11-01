-- Generated from the menu in index.html by: node scripts/export-menu-sql.js
-- Run database/schema.sql first. This seed preserves existing rows on repeat imports.
START TRANSACTION;

INSERT INTO menu_categories (name, slug, description, menu_notes, image_url, display_order)
VALUES
  ('Pye Snacks', 'pye-snacks', 'Small bites and starters to share.', NULL, 'public/snack-7.jpg', '1'),
  ('PYE OVER RICE', 'over-rice', 'Hearty mains served over steamed rice.', 'Prices: Chicken / Pork / Vegetables / Tofu — $15.95 · Beef — $17.00 · Shrimp — $18.00', 'public/rice-1.jpg', '2'),
  ('PYE BOAT NOODLES', 'boat-noodles', 'Rich, savory noodle soups inspired by Bangkok''s boat noodles.', 'Choice of noodles: rice noodles, vermicelli, wide ribbon noodles or egg noodles', 'public/noodle-4.jpg', '3'),
  ('PYE DRY NOODLES', 'dry-noodles', 'Stirred and tossed noodle dishes.', 'Prices: Chicken / Pork / Vegetables / Tofu — $15.95 · Beef — $16.95 · Shrimp — $16.95 (Pad Kee Mao +$1)', 'public/dry-noodle-2.jpg', '4'),
  ('JAE SNACKS', 'jae-snacks', 'Light snacks and small plates from Jae''s kitchen.', NULL, 'public/jae-snack-1.jpg', '5'),
  ('JAE NOODLES', 'jae-noodles', 'Jae''s signature noodle dishes.', 'Choice of noodles: rice noodles, vermicelli, wide ribbon noodles or egg noodles', 'public/jae-noodle-1.jpg', '6'),
  ('SPECIAL', 'special', 'Chef''s curated specials — seasonal and bold.', NULL, 'public/special-1.jpg', '7'),
  ('DRINKS', 'drinks', 'Refreshing beverages and Thai classics.', NULL, 'public/beverage-1.jpg', '8'),
  ('DESSERT', 'dessert', 'Sweet endings to your meal.', NULL, 'public/dessert.jpeg', '9')
ON DUPLICATE KEY UPDATE id = LAST_INSERT_ID(id);

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Dumplings', 'Minced pork ,shrimp and Jicama with sweet soy dipping.', 7.50, 0.00, 'public/snack-1.jpg', 1
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Taro Rolls', 'Taro, glass noodle, and cabbage', 5.50, 0.00, 'public/snack-2.jpg', 2
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Fried Pork Strips', 'Strips of marinated pork shoulder butt', 12.00, 0.00, 'public/snack-3.jpg', 3
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Salted Chicken Wings', '(aka tiny wings) Fried marinated split half mid-wings', 12.00, 0.00, 'public/snack-4.jpg', 4
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Papaya Salad', 'Green papaya with dried shrimp, peanuts, long beans, fresh chili in palm sugar, lime and fish sauce served with pork rinds (medium spicy)', 12.00, 0.00, 'public/snack-5.jpg', 5
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Yum Woon Sen', 'Tossed glass noodle with shrimp,  squid, dried shrimp, celery, red onion peanuts, minced pork, fresh chili in lime juice and fish sauce (medium spicy)', 13.50, 0.00, 'public/snack-6.jpg', 6
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Moo Ping', 'Marinated pork skewers served with spicy dipping sauce.', 12.00, 0.00, 'public/snack-7.jpg', 7
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Look Chin Ping', 'Grilled Beef or Pork meatballs on skewers topped with sweet and spicy sauce and cilantro.', 9.95, 0.00, 'public/snack-8.jpg', 8
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Kai Nok Krata Tod', 'Deep fried quail eggs in wonton skin with sweet chili sauce.', 8.50, 0.00, 'public/snack-9.jpg', 9
FROM menu_categories AS c WHERE c.slug = 'pye-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Pad Gra Pow', '(Medium spicy) Sauteed jalapeno with basil and long bean (slice or ground meat)', NULL, 0.00, 'public/rice-1.jpg', 1
FROM menu_categories AS c WHERE c.slug = 'over-rice'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Gra Tiem', 'Pan Fried choice of meat with garlic and pepper (DRY)', NULL, 0.00, 'public/rice-2.jpg', 2
FROM menu_categories AS c WHERE c.slug = 'over-rice'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Panang', '(Medium spicy) Sauteed panang curry with jalapeno chilli and coconut milk', NULL, 0.00, 'public/rice-3.jpg', 3
FROM menu_categories AS c WHERE c.slug = 'over-rice'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Prik Khing', '(Medium spicy) Sauteed prik khing curry with long bean and jalapeno chili', NULL, 0.00, 'public/rice-4.jpg', 4
FROM menu_categories AS c WHERE c.slug = 'over-rice'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Koa Pad Bhoo', 'Thai fried rice with crab meat', NULL, 0.00, 'public/rice-5.jpg', 5
FROM menu_categories AS c WHERE c.slug = 'over-rice'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Pad Pukk', 'Sauteed mixed vegetables with oyster sauce and sesame oil.', NULL, 0.00, 'public/rice-6.jpg', 6
FROM menu_categories AS c WHERE c.slug = 'over-rice'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Boat Noodles with Pork', 'Fresh pork blood broth with soy and anise, bean sprout,slice pork, pork meat ball top with celery and pork rind.', 16.50, 0.00, 'public/noodle-1.jpg', 1
FROM menu_categories AS c WHERE c.slug = 'boat-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Boat Noodles with Beef', 'Fresh beef blood broth with soy and anise, bean sprout , slice beef , beef meat ball top with celery and pork rind', 17.50, 0.00, 'public/noodle-2.jpg', 2
FROM menu_categories AS c WHERE c.slug = 'boat-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Tom Yum Bolarn Noodles', 'Chicken and soy broth with lime juice,bean sprout, ground pork, fish cake , shrimp meat ball and fish meat ball top with cilantro and scallion (medium spicy)', 16.50, 0.00, 'public/noodle-3.jpg', 3
FROM menu_categories AS c WHERE c.slug = 'boat-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Yen Ta Fo Noodles', 'Chicken , soy broth with red bean paste, morning glory,shrimp,squid,white fungus,fish cake,shrimp meat ball and fish meat ball top with cilantro and scallion', 17.95, 0.00, 'public/noodle-4.jpg', 4
FROM menu_categories AS c WHERE c.slug = 'boat-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Bamee bhoo Moo Dang Nam', 'Egg noodles,yu choy with crab meat and roasted pork in chicken soy broth top with cilantro and scallion', 18.50, 0.00, 'public/noodle-5.jpg', 5
FROM menu_categories AS c WHERE c.slug = 'boat-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Sukhothai Noodles', 'Chicken soy  broth, bean sprout,ground pork, peanut, dry shrimp, roasted pork, long bean and pork rind. Top with cilantro and scallion (medium Spicy)', 16.95, 0.00, 'public/noodle-6.jpg', 6
FROM menu_categories AS c WHERE c.slug = 'boat-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Chicken Noodles Soup', 'Chicken soy  broth, bean sprout, shredded chicken Top with cilantro and scallion', 15.75, 0.00, 'public/noodle-7.jpg', 7
FROM menu_categories AS c WHERE c.slug = 'boat-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Boat Noodles Beeg Pi-Set', 'Seasoning Boat noodle Beef with spicy,tangy ,Sweet,umami and savory with bean sprout,beef meat ball, slice beef, beef belly, beef cube and tripe and pork rind (Only modification allowed is spicy level)', 20.95, 0.00, 'public/noodle-8.jpg', 8
FROM menu_categories AS c WHERE c.slug = 'boat-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Pad Kee Mao', 'Sauteed wide ribbon noodles with Thai herbs, chili and mixed vegetables (spicy!!!) (Real Thai style kee mao!!!)', NULL, 1.00, 'public/dry-noodle-1.jpg', 1
FROM menu_categories AS c WHERE c.slug = 'dry-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Pad See Ew', 'Sauteed wide ribbon noodles,egg  with Chinese broccoli in sweet black soy sauce.', NULL, 0.00, 'public/dry-noodle-2.jpg', 2
FROM menu_categories AS c WHERE c.slug = 'dry-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Pad Thai', 'Sauteed rice noodle, egg Black tofu, chive, bean sprout with palm sugar tamarind sauce.', NULL, 0.00, 'public/dry-noodle-3.jpg', 3
FROM menu_categories AS c WHERE c.slug = 'dry-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Ba Mee Moo Dang Hang', 'Egg noodles, yu choy with roasted pork and crab meat with cilantro and scallion (No soup)', 18.50, 0.00, 'public/dry-noodle-4.jpg', 4
FROM menu_categories AS c WHERE c.slug = 'dry-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Kua Noodles', 'Sauteed wide ribbon noodles, egg ,bean sprout with chicken and squid in light brown sauce.', 17.50, 0.00, 'public/dry-noodle-5.jpg', 5
FROM menu_categories AS c WHERE c.slug = 'dry-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Fried Tofu', 'Fried tofu served with sweet chili sauce and crushed peanuts.', 6.95, 0.00, 'public/jae-snack-1.jpg', 1
FROM menu_categories AS c WHERE c.slug = 'jae-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Taro Rolls', 'Taro rolls served with sweet chili sauce', 6.95, 0.00, 'public/jae-snack-2.jpg', 2
FROM menu_categories AS c WHERE c.slug = 'jae-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Chive Pancake', 'Chive pancakes served with sweet dark soy sauce', 9.50, 0.00, 'public/jae-snack-3.jpg', 3
FROM menu_categories AS c WHERE c.slug = 'jae-snacks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Jae Noodle Soup', 'Noodle soup in vegetable broth with Seitan,yu choy and shitake mushrooms top with cilantro and scallion.', 15.95, 0.00, 'public/jae-noodle-1.jpg', 1
FROM menu_categories AS c WHERE c.slug = 'jae-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Tom Yum Jae', 'Spicy and sour broth with Seitan,bean sprout and shitake mushrooms crushed peanuts top with cilantro and scallion.', 15.95, 0.00, 'public/jae-noodle-2.jpg', 2
FROM menu_categories AS c WHERE c.slug = 'jae-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Yen Ta Fo Jae', 'Sour red bean paste in vegetable broth with white mushroom, mixed vegetables and tofu top with cilantro and scallion.', 16.50, 0.00, 'public/jae-noodle-3.jpg', 3
FROM menu_categories AS c WHERE c.slug = 'jae-noodles'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Goi Neur', 'Northeastern Thai style Raw Beef with lime, chili, red onion, cilantro, scallion and ground toasted sweet rice(meat is chill)', 13.50, 0.00, 'public/special-1.jpg', 1
FROM menu_categories AS c WHERE c.slug = 'special'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Larb-Moo', 'Minced pork with chili , lime ,red onion, cilantro, scallion and ground toasted sweet rice', 9.50, 0.00, 'public/special-2.jpg', 2
FROM menu_categories AS c WHERE c.slug = 'special'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Kang Pet Ped', 'Roasted duck in red curry , basil , pineapple, grape , tomatoes and jalapeno', 21.50, 0.00, 'public/special-3.jpg', 3
FROM menu_categories AS c WHERE c.slug = 'special'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Khoa Moo Dang', 'Roasted pork with sesame and sweet gravy over rice', 16.95, 0.00, 'public/special-4.jpg', 4
FROM menu_categories AS c WHERE c.slug = 'special'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Koa Loa Lerd Moo', 'Mixed pork soup with sliced pork, ground pork, pork blood cake , pork liver in chicken broth top with celery served with rice', 17.50, 0.00, 'public/special-5.jpg', 5
FROM menu_categories AS c WHERE c.slug = 'special'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Thai Iced Tea with Milk', 'Sweet, creamy brewed tea with condensed milk.', 5.00, 0.00, 'public/beverage-1.jpg', 1
FROM menu_categories AS c WHERE c.slug = 'drinks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Thai iced tea with Lime', 'Sweet and creamy tea infused with lime.', 5.00, 0.00, 'public/beverage-2.webp', 2
FROM menu_categories AS c WHERE c.slug = 'drinks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Thai Iced Coffee', 'Strong and sweet coffee served over ice.', 5.00, 0.00, 'public/beverage-3.jpg', 3
FROM menu_categories AS c WHERE c.slug = 'drinks'
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO menu_items (category_id, name, description, price, price_modifier, image_url, display_order)
SELECT c.id, 'Pang sang ka ya', 'Steamed bread cube topped with pandan custard', 11.00, 0.00, 'public/dessert.jpeg', 1
FROM menu_categories AS c WHERE c.slug = 'dessert'
ON DUPLICATE KEY UPDATE id = id;

COMMIT;
