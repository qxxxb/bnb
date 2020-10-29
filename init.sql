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
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'Y2F0c2FyZXNoaXQ=',
    'Cat picture',
    'A single cat picture. Highest quality guaranteed. Love it or YOUR MONEY BACK.',
    'pictures',
    'jpg',
    1499,
    'John Doe''s Store'
);

INSERT INTO item (
    serial_no,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'Y2F0c2FyZWR1bWI=',
    'Another cat picture',
    'Another one of my cat pictures. Highest quality guaranteed',
    'pictures',
    'png',
    799,
    'John Doe''s Store'
);

INSERT INTO item (
    serial_no,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'Y2F0c2FyZXJldGFyZGVk',
    'Dog picture',
    'A single dog picture. Enjoy.',
    'pictures',
    'jpg',
    899,
    'John Doe''s Store'
);

INSERT INTO item (
    serial_no,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'aGFtYnVyZ2Vy',
    'Corndog recipe',
    'Recipe on how to cook a corndog. Batteries not included',
    'recipes',
    'pdf',
    1500,
    'Palace of Yu-Shiang'
);

INSERT INTO item (
    serial_no,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'YmVlc2VjaHVyZ2Vy',
    'Cheeseburger recipe',
    'Recipe on how to make a beesechurger.',
    'recipes',
    'pdf',
    2000,
    'Palace of Yu-Shiang'
);

INSERT INTO item (
    serial_no,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (
    'Y2FsaWNpdW1pc2dvb2Rmb3J5b3VyYm9uZXM=',
    'White Bone',
    'A white bone. A single white bone. Very clean.',
    'misc',
    'bone',
    9999,
    'Noah''s Doghouse'
);
