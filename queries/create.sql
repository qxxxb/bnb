CREATE TABLE user (
    email VARCHAR(20) NOT NULL,
    karma_points INT NOT NULL DEFAULT 0,
    has_photo INT NOT NULL DEFAULT 0,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    PRIMARY KEY(email)
);

CREATE TABLE card (
    card_no VARCHAR(20) NOT NULL,
    pin INT NOT NULL,
    type VARCHAR(10) NOT NULL,
    expire_month INT NOT NULL,
    expire_year INT NOT NULL,
    PRIMARY KEY(card_no)
);

CREATE TABLE seller (
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY(email),
    FOREIGN KEY(email) REFERENCES user(email) ON DELETE CASCADE
);

CREATE TABLE buyer (
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY(email),
    FOREIGN KEY(email) REFERENCES user(email) ON DELETE CASCADE
);

CREATE TABLE store (
    name VARCHAR(20) NOT NULL,
    seller_email VARCHAR(20) NOT NULL,
    PRIMARY KEY(name),
    FOREIGN KEY(seller_email) REFERENCES seller(email) ON DELETE CASCADE
);

CREATE TABLE 'order' (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    buyer_email VARCHAR(20) NOT NULL,
    delivery_email VARCHAR(20) NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    card_no VARCHAR(20) NOT NULL,
    FOREIGN KEY(buyer_email) REFERENCES buyer(email) ON DELETE CASCADE,
    FOREIGN KEY(card_no) REFERENCES card(card_no)
);

CREATE TABLE order_contents (
    order_id INTEGER NOT NULL,
    serial_no VARCHAR(20) NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY(order_id, serial_no),
    FOREIGN KEY(order_id) REFERENCES 'order'(id) ON DELETE CASCADE,
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE
);

CREATE TABLE item (
    serial_no VARCHAR(20) NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    quantity_sold INT NOT NULL DEFAULT 0,
    title VARCHAR(20) NOT NULL,
    description VARCHAR(200),
    category VARCHAR(20) NOT NULL,
    file_type VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    store_name VARCHAR(20) NOT NULL,
    PRIMARY KEY(serial_no),
    FOREIGN KEY(store_name) REFERENCES store(name) ON DELETE CASCADE
);

CREATE TABLE coupon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    discount INT NOT NULL,
    serial_no VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE,
    FOREIGN KEY(email) REFERENCES buyer(email) ON DELETE CASCADE
);

CREATE TABLE item_review (
    serial_no VARCHAR(20) NOT NULL,
    reviewer_email VARCHAR(20) NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(200),
    PRIMARY KEY(serial_no, reviewer_email)
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE,
    FOREIGN KEY(reviewer_email) REFERENCES buyer(email) ON DELETE CASCADE
);

CREATE TABLE store_review (
    store_name VARCHAR(20) NOT NULL,
    reviewer_email VARCHAR(20) NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(200),
    FOREIGN KEY(reviewer_email) REFERENCES buyer(email) ON DELETE CASCADE,
    FOREIGN KEY (store_name) REFERENCES store(name) ON DELETE CASCADE
);

CREATE TABLE wishlist (
    serial_no VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE,
    FOREIGN KEY(email) REFERENCES buyer(email) ON DELETE CASCADE
);

CREATE TABLE buyer_card (
    email VARCHAR(20) NOT NULL,
    card_no VARCHAR(20) NOT NULL,
    FOREIGN KEY(email) REFERENCES buyer(email) ON DELETE CASCADE,
    FOREIGN KEY(card_no) REFERENCES card(card_no) ON DELETE CASCADE
);

CREATE TABLE item_keyword (
    serial_no VARCHAR(20) NOT NULL,
    keyword VARCHAR(10) NOT NULL,
    PRIMARY KEY(serial_no, keyword),
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE
);

CREATE TABLE item_accepted_card (
    serial_no VARCHAR(20) NOT NULL,
    card_type VARCHAR(10) NOT NULL,
    PRIMARY KEY(serial_no, card_type),
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE
);
