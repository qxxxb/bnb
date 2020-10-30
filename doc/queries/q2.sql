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
    FOREIGN KEY(email) REFERENCES user(email)
);

CREATE TABLE buyer (
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY(email),
    FOREIGN KEY(email) REFERENCES user(email)
);

CREATE TABLE store (
    name VARCHAR(20) NOT NULL,
    seller_email VARCHAR(20) NOT NULL,
    PRIMARY KEY(name),
    FOREIGN KEY(seller_email) REFERENCES seller(email)
);

CREATE TABLE 'order' (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    buyer_email VARCHAR(20) NOT NULL,
    delivery_email VARCHAR(20) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    card_no VARCHAR(20) NOT NULL,
    FOREIGN KEY(buyer_email) REFERENCES buyer(email),
    FOREIGN KEY(card_no) REFERENCES card(card_no)
);

CREATE TABLE order_contents (
    order_id INTEGER NOT NULL,
    serial_no VARCHAR(20) NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY(order_id, serial_no),
    FOREIGN KEY(order_id) REFERENCES 'order'(id),
    FOREIGN KEY(serial_no) REFERENCES item(serial_no)
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
    FOREIGN KEY(store_name) REFERENCES store(name)
);

CREATE TABLE coupon (
    id INT NOT NULL,
    discount INT NOT NULL,
    serial_no VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(serial_no) REFERENCES item(serial_no),
    FOREIGN KEY(email) REFERENCES buyer(email)
);

CREATE TABLE item_review (
    serial_no VARCHAR(20) NOT NULL,
    reviewer_email VARCHAR(20) NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(200),
    PRIMARY KEY(serial_no, reviewer_email)
    FOREIGN KEY(serial_no) REFERENCES item(serial_no),
    FOREIGN KEY(reviewer_email) REFERENCES buyer(email)
);

CREATE TABLE store_review (
    store_name VARCHAR(20) NOT NULL,
    reviewer_email VARCHAR(20) NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(200),
    FOREIGN KEY(reviewer_email) REFERENCES buyer(email),
    FOREIGN KEY (store_name) REFERENCES store(name)
);

CREATE TABLE wishlist (
    serial_no VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    FOREIGN KEY(serial_no) REFERENCES item(serial_no),
    FOREIGN KEY(email) REFERENCES buyer(email)
);

CREATE TABLE buyer_card (
    email VARCHAR(20) NOT NULL,
    card_no VARCHAR(20) NOT NULL,
    FOREIGN KEY(email) REFERENCES buyer(email),
    FOREIGN KEY(card_no) REFERENCES card(card_no)
);

CREATE TABLE item_keyword (
    serial_no VARCHAR(20) NOT NULL,
    keyword VARCHAR(10) NOT NULL,
    PRIMARY KEY(serial_no, keyword),
    FOREIGN KEY(serial_no) REFERENCES item(serial_no)
);

CREATE TABLE item_accepted_card (
    serial_no VARCHAR(20) NOT NULL,
    card_type VARCHAR(10) NOT NULL,
    PRIMARY KEY(serial_no, card_type),
    FOREIGN KEY(serial_no) REFERENCES item(serial_no)
);

INSERT INTO user (email, first_name, last_name)
VALUES ('johndoe@gmail.com', 'John', 'Doe');

INSERT INTO user (email, first_name, last_name, has_photo)
VALUES ('janedoe@gmail.com', 'Jane', 'Doe', 1);

INSERT INTO user (email, first_name, last_name, karma_points)
VALUES ('jeng.28@osu.edu', 'Yu-Shiang', 'Jeng', 5);

INSERT INTO user (email, first_name, last_name, karma_points, has_photo)
VALUES ('platt.113@osu.edu', 'Sarah', 'Platt', 6, 1);

INSERT INTO user (email, first_name, last_name, karma_points, has_photo)
VALUES ('chongsiriwatana.3@osu.edu', 'Noah', 'Chongsiriwatana', 6, 1);

INSERT INTO user (email, first_name, last_name, karma_points)
VALUES ('coyle.128@osu.edu', 'Andrew', 'Coyle', 9);

INSERT INTO card (
    card_no,
    pin,
    type,
    expire_month,
    expire_year
) VALUES ('4024007117502335', 356, 'VISA', 09, 2021);

INSERT INTO card (
    card_no,
    pin,
    type,
    expire_month,
    expire_year
) VALUES ('5257600929429963', 121, 'Mastercard', 02, 2022);

INSERT INTO card (
    card_no,
    pin,
    type,
    expire_month,
    expire_year
) VALUES ('6011296490792965', 910, 'Discover', 12, 2020);

INSERT INTO buyer_card (email, card_no)
VALUES ('janedoe@gmail.com', '4024007117502335');

INSERT INTO buyer_card (email, card_no)
VALUES ('janedoe@gmail.com', '5257600929429963');

INSERT INTO buyer_card (email, card_no)
VALUES ('jeng.28@osu.edu', '6011296490792965');

INSERT INTO seller (email)
VALUES ('johndoe@gmail.com');

INSERT INTO seller (email)
VALUES ('jeng.28@osu.edu');

INSERT INTO seller (email)
VALUES ('chongsiriwatana.3@osu.edu');

INSERT INTO buyer (email)
VALUES ('janedoe@gmail.com');

INSERT INTO buyer (email)
VALUES ('johndoe@gmail.com');

INSERT INTO buyer (email)
VALUES ('jeng.28@osu.edu');

INSERT INTO buyer (email)
VALUES ('platt.113@osu.edu');

INSERT INTO store (name, seller_email)
VALUES ('John Doe''s Store', 'johndoe@gmail.com');

INSERT INTO store (name, seller_email)
VALUES ('Palace of Yu-Shiang', 'jeng.28@osu.edu');

INSERT INTO store (name, seller_email)
VALUES ('Noah''s Doghouse', 'chongsiriwatana.3@osu.edu');

INSERT INTO item (
    serial_no,
    quantity,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'Y2F0c2FyZXNoaXQ=',
    3,
    'Cat picture',
    'A single cat picture. Highest quality guaranteed. Love it or YOUR MONEY BACK.',
    'pictures',
    'jpg',
    1499,
    'John Doe''s Store'
);

INSERT INTO item (
    serial_no,
    quantity,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'Y2F0c2FyZWR1bWI=',
    3,
    'Another cat picture',
    'Another one of my cat pictures. Highest quality guaranteed',
    'pictures',
    'png',
    799,
    'John Doe''s Store'
);

INSERT INTO item (
    serial_no,
    quantity,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'Y2F0c2FyZXJldGFyZGVk',
    2,
    'Dog picture',
    'A single dog picture. Enjoy.',
    'pictures',
    'jpg',
    899,
    'John Doe''s Store'
);

INSERT INTO item (
    serial_no,
    quantity,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'aGFtYnVyZ2Vy',
    5,
    'Corndog recipe',
    'Recipe on how to cook a corndog. Batteries not included',
    'recipes',
    'pdf',
    1500,
    'Palace of Yu-Shiang'
);

INSERT INTO item (
    serial_no,
    quantity,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'YmVlc2VjaHVyZ2Vy',
    5,
    'Cheeseburger recipe',
    'Recipe on how to make a beesechurger.',
    'recipes',
    'pdf',
    2000,
    'Palace of Yu-Shiang'
);

INSERT INTO item (
    serial_no,
    quantity,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'Y2FsaWNpdW1pc2dvb2Rmb3J5b3VyYm9uZXM=',
    4,
    'White Bone',
    'A white bone. A single white bone. Very clean.',
    'misc',
    'bone',
    9999,
    'Noah''s Doghouse'
);

/* 1: Jane Doe orders 'Cat picture' and 'Another cat picture' */

INSERT INTO 'order' (
    buyer_email,
    delivery_email,
    timestamp,
    card_no
) VALUES (
    'janedoe@gmail.com',
    'grandmadoe@gmail.com',
    strftime('%s', '2019-05-01 12:30:56'),
    '4024007117502335'
);

INSERT INTO order_contents (order_id, serial_no)
VALUES (1, 'Y2F0c2FyZXNoaXQ=');

UPDATE item SET quantity_sold = quantity_sold + 1
WHERE serial_no = 'Y2F0c2FyZXNoaXQ=';

INSERT INTO order_contents (order_id, serial_no)
VALUES (1, 'Y2F0c2FyZWR1bWI=');

UPDATE item SET quantity_sold = quantity_sold + 1
WHERE serial_no = 'Y2F0c2FyZWR1bWI=';

/* 2: Jane Doe orders 'Dog picture' */

INSERT INTO 'order' (
    buyer_email,
    delivery_email,
    timestamp,
    card_no
) VALUES (
    'janedoe@gmail.com',
    'juniordoe@gmail.com',
    strftime('%s', '2019-12-24 00:10:22'),
    '5257600929429963'
);

INSERT INTO order_contents (order_id, serial_no)
VALUES (2, 'Y2F0c2FyZXJldGFyZGVk');

UPDATE item SET quantity_sold = quantity_sold + 1
WHERE serial_no = 'Y2F0c2FyZXJldGFyZGVk';

/* 3: Yu-Shiang Jeng orders 2 'White bone' items */

INSERT INTO 'order' (
    buyer_email,
    delivery_email,
    timestamp,
    card_no
) VALUES (
    'jeng.28@osu.edu',
    'coyle.128@osu.edu',
    strftime('%s', '2020-10-28 00:10:23'),
    '6011296490792965'
);

INSERT INTO order_contents (order_id, serial_no, quantity)
VALUES (3, 'Y2FsaWNpdW1pc2dvb2Rmb3J5b3VyYm9uZXM=', 2);

UPDATE item SET quantity_sold = quantity_sold + 2
WHERE serial_no = 'Y2FsaWNpdW1pc2dvb2Rmb3J5b3VyYm9uZXM=';

/* --- */

INSERT INTO store_review (
    store_name,
    reviewer_email,
    rating,
    review
) VALUES (
    'Palace of Yu-Shiang',
    'chongsiriwatana.3@osu.edu',
    5,
    'I love Yu-Shiang''s palace. 10/10 would go again.'
);

INSERT INTO store_review (
    store_name,
    reviewer_email,
    rating,
    review
) VALUES (
    'Palace of Yu-Shiang',
    'janedoe@gmail.com',
    2,
    'I hate Yu-Shiang. Do not go.'
);

INSERT INTO wishlist (serial_no, email)
VALUES ('aGFtYnVyZ2Vy', 'chongsiriwatana.3@osu.edu');

INSERT INTO wishlist (serial_no, email)
VALUES ('YmVlc2VjaHVyZ2Vy', 'chongsiriwatana.3@osu.edu');

INSERT INTO store_review (
    store_name,
    reviewer_email,
    rating,
    review
) VALUES (
    'Palace of Yu-Shiang',
    'janedoe@gmail.com',
    2,
    'I hate Yu-Shiang. Do not go.'
);
