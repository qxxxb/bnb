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

INSERT INTO buyer_order (
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

INSERT INTO buyer_order_contents (order_id, serial_no)
VALUES (1, 'Y2F0c2FyZXNoaXQ=');

UPDATE item SET quantity_sold = quantity_sold + 1
WHERE serial_no = 'Y2F0c2FyZXNoaXQ=';

INSERT INTO buyer_order_contents (order_id, serial_no)
VALUES (1, 'Y2F0c2FyZWR1bWI=');

UPDATE item SET quantity_sold = quantity_sold + 1
WHERE serial_no = 'Y2F0c2FyZWR1bWI=';

/* 2: Jane Doe orders 'Dog picture' */

INSERT INTO buyer_order (
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

INSERT INTO buyer_order_contents (order_id, serial_no)
VALUES (2, 'Y2F0c2FyZXJldGFyZGVk');

UPDATE item SET quantity_sold = quantity_sold + 1
WHERE serial_no = 'Y2F0c2FyZXJldGFyZGVk';

/* 3: Yu-Shiang Jeng orders 2 'White bone' items */

INSERT INTO buyer_order (
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

INSERT INTO buyer_order_contents (order_id, serial_no, quantity)
VALUES (3, 'Y2FsaWNpdW1pc2dvb2Rmb3J5b3VyYm9uZXM=', 2);

UPDATE item SET quantity_sold = quantity_sold + 2
WHERE serial_no = 'Y2FsaWNpdW1pc2dvb2Rmb3J5b3VyYm9uZXM=';
