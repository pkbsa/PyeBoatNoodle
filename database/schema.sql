CREATE DATABASE IF NOT EXISTS pyeboat
	CHARACTER SET utf8mb4
	COLLATE utf8mb4_unicode_ci;

USE pyeboat;

CREATE TABLE IF NOT EXISTS menu_categories (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(120) NOT NULL,
	slug VARCHAR(140) NOT NULL,
	description TEXT NULL,
	menu_notes TEXT NULL,
	image_url VARCHAR(500) NULL,
	display_order INT NOT NULL DEFAULT 0,
	is_active BOOLEAN NOT NULL DEFAULT TRUE,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY uq_menu_categories_slug (slug),
	KEY idx_menu_categories_listing (is_active, display_order)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS menu_items (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	category_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(160) NOT NULL,
	description TEXT NULL,
	price DECIMAL(10, 2) NULL,
	price_modifier DECIMAL(10, 2) NOT NULL DEFAULT 0,
	image_url VARCHAR(500) NULL,
	display_order INT NOT NULL DEFAULT 0,
	is_available BOOLEAN NOT NULL DEFAULT TRUE,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	UNIQUE KEY uq_menu_items_category_name (category_id, name),
	KEY idx_menu_items_category_listing (category_id, is_available, display_order),
	CONSTRAINT chk_menu_items_price CHECK (price IS NULL OR price >= 0),
	CONSTRAINT chk_menu_items_price_modifier CHECK (price_modifier >= 0),
	CONSTRAINT fk_menu_items_category
		FOREIGN KEY (category_id) REFERENCES menu_categories (id)
		ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;
