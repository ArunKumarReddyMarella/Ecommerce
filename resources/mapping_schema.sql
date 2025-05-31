-- Drop the ecommerce Schema if it exists
DROP SCHEMA IF EXISTS ecommerce_mapping;

-- Create the ecommerce Schema
CREATE SCHEMA IF NOT EXISTS ecommerce_mapping;
USE ecommerce_mapping;

-- Drop country Table if it exists
DROP TABLE IF EXISTS country;

-- Create country Table
CREATE TABLE country (
    country_id VARCHAR(50) PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    last_update TIMESTAMP
);

-- Drop Products Table if it exists
DROP TABLE IF EXISTS product;

-- Create Products Table
CREATE TABLE product (
    product_id VARCHAR(255) PRIMARY KEY,
    crawl_timestamp TIMESTAMP,
    product_url TEXT,
    product_name TEXT NOT NULL,
    categories TEXT NOT NULL,
    pid VARCHAR(255),
    retail_price DECIMAL(10, 2) NOT NULL,
    discounted_price DECIMAL(10, 2) NOT NULL,
    image_urls JSON, -- Array of image URLs
    is_FK_Advantage_product BOOLEAN,
    product_description TEXT NOT NULL,
    product_rating VARCHAR(2550),
    overall_rating VARCHAR(2550),
    brand VARCHAR(1000) NOT NULL,
    product_specifications TEXT,
    stock_quantity INT NOT NULL,
    quantity_unit VARCHAR(1000),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---

## Dependent Tables (ordered by dependencies)

-- Drop city Table if it exists
DROP TABLE IF EXISTS city;

-- Create city Table
CREATE TABLE city (
    city_id VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    country_id VARCHAR(50) NOT NULL,
    last_update TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Drop Addresses Table if it exists
DROP TABLE IF EXISTS address;

-- Create Addresses Table
CREATE TABLE address (
    address_id VARCHAR(50) PRIMARY KEY,
    primary_address VARCHAR(50) NOT NULL,
    secondary_address VARCHAR(50),
    district VARCHAR(20),
    city_id VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10),
    phone VARCHAR(20),
    location GEOMETRY,
    last_update TIMESTAMP,
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- Drop Users Table if it exists
DROP TABLE IF EXISTS user;

-- Create Users Table
CREATE TABLE user (
    user_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address_id VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Drop Cart Table if it exists
DROP TABLE IF EXISTS cart;

-- Create Cart Table
CREATE TABLE cart (
    cart_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Drop Wishlist Table if it exists
DROP TABLE IF EXISTS wishlist;

-- Create Wishlist Table
CREATE TABLE wishlist (
    wishlist_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Drop Orders Table if it exists
DROP TABLE IF EXISTS orders;

-- Create Orders Table
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Drop Order Items Table if it exists
DROP TABLE IF EXISTS order_items;

-- Create Order Items Table
CREATE TABLE order_items (
    order_item_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Drop Ratings Table if it exists
DROP TABLE IF EXISTS rating;

-- Create Ratings Table
CREATE TABLE rating (
    rating_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    rating INT NOT NULL,
    review TEXT, -- Text format for review
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Drop Rating Images Table if it exists
DROP TABLE IF EXISTS rating_images;

-- Create Rating Images Table
CREATE TABLE rating_images (
    image_id VARCHAR(50) PRIMARY KEY,
    rating_id VARCHAR(50) NOT NULL,
    image LONGBLOB, -- Direct image data
    meta_data1 VARCHAR(255),
    meta_data2 VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rating_id) REFERENCES rating(rating_id) ON DELETE CASCADE
);

-- Drop Cards Table if it exists
DROP TABLE IF EXISTS card;

-- Create Cards Table
CREATE TABLE card (
    card_id VARCHAR(50) PRIMARY KEY,
    card_number VARCHAR(50) NOT NULL,
    card_holder_name VARCHAR(255) NOT NULL,
    card_type VARCHAR(50) NOT NULL,
    expiration_date DATE NOT NULL,
    cvv INT NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Drop Transactions Table if it exists
DROP TABLE IF EXISTS transactions;

-- Create Transactions Table
CREATE TABLE transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    card_id VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (card_id) REFERENCES card(card_id)
);

-- Drop Invoices Table if it exists
DROP TABLE IF EXISTS invoices;

-- Create Invoices Table
CREATE TABLE invoices (
    invoice_id VARCHAR(50) PRIMARY KEY,
    transaction_id VARCHAR(50) NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);