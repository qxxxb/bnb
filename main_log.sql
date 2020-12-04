/* # CP 3 */

/* ## Question 3 */

/* (3.a) Find the titles of all items by a given seller that cost less than $10 */
SELECT item.title
FROM item, store, seller
WHERE
    seller.email = 'bartonshelley@hotmail.com' AND
    seller.email = store.seller_email AND
    store.name = item.store_name AND
    item.price < 1000;

/* (3.b) Give all titles and their dates of purchase made by a given buyer */
SELECT item.title, 'order'.timestamp
FROM buyer, 'order', order_contents, item
WHERE
    buyer.email = 'klinelinda@gallegos.org' AND
    buyer.email = 'order'.buyer_email AND
    'order'.id = order_contents.order_id AND
    order_contents.serial_no = item.serial_no;

/* (3.c) Find seller names with less than 10 items for sale */
SELECT user.first_name, user.last_name, SUM(item.quantity)
FROM user, store, item
WHERE
    user.email = store.seller_email AND
    item.store_name = store.name
GROUP BY user.email
HAVING SUM(item.quantity) < 10;

/* (3.d) Give all buyers who purchased an item by a given seller and the names of the items they purchased */
SELECT 'order'.buyer_email, item.title
FROM seller, store, item, order_contents, 'order'
WHERE
    seller.email = 'lindsayspencer@wyatt.biz' AND
    seller.email = store.seller_email AND
    store.name = item.store_name AND
    item.serial_no = order_contents.serial_no AND
    order_contents.order_id = 'order'.id;

/* (3.e) Find the total number of items purchased by a given buyer */
SELECT buyer.email, SUM(order_contents.quantity)
FROM buyer, 'order', order_contents
WHERE
    buyer.email = 'klinelinda@gallegos.org' AND
    buyer.email = 'order'.buyer_email AND
        'order'.id = order_contents.order_id;

/* (3.f) Find the buyer who purchased the most number of items */
SELECT email, MAX(`SUM(order_contents.quantity)`)
FROM (
    SELECT buyer.email, SUM(order_contents.quantity)
    FROM buyer, 'order', order_contents
    WHERE
        buyer.email = 'order'.buyer_email AND
        'order'.id = order_contents.order_id
    GROUP BY buyer.email
);

/* ## Question 4 */

/* (4.a) List stores with an average rating above 2 */
SELECT store.name, AVG(rating)
FROM store, store_review
WHERE store.name = store_review.store_name
GROUP BY store.name
HAVING AVG(rating) > 2

/* (4.b) List items and prices of a user's wishlist */
SELECT buyer.email, item.title, item.price
FROM buyer, wishlist, item
WHERE
    buyer.email = 'vgarcia@hodge.com' AND
    buyer.email = wishlist.email AND
    wishlist.serial_no = item.serial_no;

/* (4.c) Get the sum of item prices on all wishlists, ordered by price */
SELECT user.email, SUM(item.price)
FROM user, wishlist, item
WHERE
    user.email = wishlist.email AND
    wishlist.serial_no = item.serial_no
GROUP BY user.email
ORDER BY SUM(item.price) ASC

/* ## Question 5 */

/* (5.a) List of buyer names with total dollar amount spent */
SELECT
    buyer.email,
    ROUND(SUM(item.price) * order_contents.quantity / 100.0, 2)
FROM buyer, 'order', order_contents, item
WHERE
    buyer.email = 'order'.buyer_email AND
    'order'.id = order_contents.order_id AND
    order_contents.serial_no = item.serial_no
GROUP BY buyer.email;

/* (5.b) List buyers names and emails who have spent more than the average buyer */
SELECT
    user.first_name,
    user.last_name,
    buyer.email
FROM buyer, 'order', order_contents, item, user
WHERE
    buyer.email = 'order'.buyer_email AND
    'order'.id = order_contents.order_id AND
    order_contents.serial_no = item.serial_no AND
    user.email = buyer.email
GROUP BY user.email
HAVING SUM(item.price) * order_contents.quantity > (
    SELECT AVG(spent) FROM (
        SELECT
            buyer.email,
            SUM(item.price) * order_contents.quantity as spent
        FROM buyer, 'order', order_contents, item
        WHERE
            buyer.email = 'order'.buyer_email AND
            'order'.id = order_contents.order_id AND
            order_contents.serial_no = item.serial_no
        GROUP BY buyer.email
    )
);

/* (5.c) List all item names and their total copies sold, sorted from most copies sold to least */
SELECT item.title, SUM(quantity_sold)
FROM item
LEFT JOIN order_contents ON item.serial_no = order_contents.serial_no
GROUP BY item.serial_no
ORDER BY SUM(quantity_sold) DESC;

/* (5.d) Provide a list of item names and associated dollar totals for copies sold to all buyers, sorted from highest dollar amount to lowest */
SELECT
    item.title,
    SUM(quantity_sold),
    SUM(quantity_sold) * item.price as accum_price
FROM item
LEFT JOIN order_contents ON item.serial_no = order_contents.serial_no
GROUP BY item.serial_no
ORDER BY accum_price DESC;

/* (5.e) Find the seller who sold the most items */
SELECT email, MAX(total_quantity_sold) FROM (
    SELECT seller.email, SUM(quantity_sold) AS total_quantity_sold
    FROM seller, store, item
    WHERE
        seller.email = store.seller_email AND
        store.name = item.store_name
    GROUP BY seller.email
    ORDER BY SUM(quantity_sold) DESC
);

/* (5.f) Find the most profitable seller */
SELECT email, MAX(profit)
FROM (
    SELECT seller.email, SUM(quantity_sold) * item.price AS profit
    FROM seller, store, item
    WHERE
        seller.email = store.seller_email AND
        store.name = item.store_name
    GROUP BY seller.email
    ORDER BY SUM(quantity_sold) DESC
);

/* (5.g) List buyer names who have purchased from the most profitable seller */
SELECT 'order'.buyer_email
FROM
    (
        SELECT email, MAX(profit)
        FROM (
            SELECT seller.email, SUM(quantity_sold) * item.price AS profit
            FROM seller, store, item
            WHERE
                seller.email = store.seller_email AND
                store.name = item.store_name
            GROUP BY seller.email
            ORDER BY SUM(quantity_sold) DESC
        )
    ),
    store,
    item,
    order_contents,
    'order'
WHERE
    email = store.seller_email AND
    store.name = item.store_name AND
    item.serial_no = order_contents.serial_no AND
    order_contents.order_id = 'order'.id

/* (5.h) List sellers who listed items purchased by the buyers who spent above average */
SELECT email
FROM seller, store, item, (
    SELECT item.serial_no as special_serials
    FROM user, buyer, 'order', order_contents, item
    WHERE
        user.email = buyer.email AND
        buyer.email = 'order'.buyer_email AND
        'order'.id = order_contents.order_id AND
        order_contents.serial_no = item.serial_no
    GROUP BY user.email
    HAVING SUM(item.price) * order_contents.quantity > (
        SELECT AVG(spent) FROM (
            SELECT
                user.email,
                SUM(item.price) * order_contents.quantity as spent
            FROM user, buyer, 'order', order_contents, item
            WHERE
                user.email = buyer.email AND
                buyer.email = 'order'.buyer_email AND
                'order'.id = order_contents.order_id AND
                order_contents.serial_no = item.serial_no
            GROUP BY user.email
        )
    )
)
WHERE
    special_serials = item.serial_no AND
    item.store_name = store.name AND
    store.seller_email = seller.email

/* # CP 4 */

/* ## Question 5 */

/* (5.a) We created a view that lists all items along with their average rating. */
SELECT * FROM avg_item_rating;

/* (5.b) We created a view that lists all orders along with their total price of items purchased */
SELECT * FROM order_price;

/* ## Question 7 */

/* (7.a) Sample transaction for placing an order */
BEGIN TRANSACTION;
INSERT OR ROLLBACK INTO 'order' (
        id,
        buyer_email,
        delivery_email,
        card_no
    ) VALUES (
        301,
        'klinelinda@gallegos.org',
        'johndoe@gmail.com',
        '4645029277102275'
    );
INSERT OR ROLLBACK INTO order_contents (
        order_id,
        serial_no,
        quantity
    ) VALUES (
        301,
        'XMMDEQZECUBMWVS8',
        2
    );
UPDATE or ROLLBACK item
    SET
        quantity = quantity - 2,
        quantity_sold = quantity_sold + 2
    WHERE serial_no = 'XMMDEQZECUBMWVS8';
INSERT OR ROLLBACK INTO order_contents (
        order_id,
        serial_no,
        quantity
    ) VALUES (
        301,
        'GF4IPWZXNXZNUJM',
        5
    );
UPDATE or ROLLBACK item
    SET
        quantity = quantity - 5,
        quantity_sold = quantity_sold + 5
    WHERE serial_no = 'GF4IPWZXNXZNUJM';
END TRANSACTION;
SELECT id, buyer_email, delivery_email, timestamp
FROM 'order'
WHERE id = 301;

/* (7.b) Sample transaction for creating a store */
BEGIN TRANSACTION;
INSERT OR IGNORE INTO seller (email)
    VALUES ('hsolomon@cobb.com');
INSERT OR ROLLBACK INTO store (name, seller_email)
    VALUES ('Costco Hotdogs', 'hsolomon@cobb.com');
END TRANSACTION;
SELECT seller_email, name
FROM store
WHERE store.seller_email = 'hsolomon@cobb.com';

/* # Final document */

/* ## Inserting records */

/* ### Inserting items */

BEGIN
INSERT INTO item (
    serial_no,
    quantity,
    quantity_sold,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES ('6DLOKO1H', 48, 30, 're-contextualize best-of-breed action-items', 'Hear claim fund only finish goal of official.', 'music', 'docx', 7830, 'Ross PLC');
/* Inserted new item 're-contextualize best-of-breed action-items' with serial number '6DLOKO1H' in store 'Ross PLC' */

/* ### Inserting orders */

/* See CP4 quesiton 7.a */

/* ### Inserting sellers */

INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
VALUES ('robin73@bowman-smith.info', 'Anthony', 'Roy', 1, 9326);
/* Inserted user 'Anthony Roy' with email 'robin73@bowman-smith.info' */
INSERT INTO seller (email)
VALUES ('robin73@bowman-smith.info');
/* Inserted seller 'robin73@bowman-smith.info' */

/* ### Inserting buyers */

INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
VALUES ('astewart@taylor.com', 'Linda', 'Kim', 0, 8780);
/* Inserted user 'Linda Kim' with email 'astewart@taylor.com' */
INSERT INTO buyer (email)
VALUES ('astewart@taylor.com');
/* Inserted buyer 'astewart@taylor.com' */

/* ## Deleting records */

/* ### Deleting items */

DELETE FROM item
WHERE serial_no = '13QF5RTP';
/* Deleted item '13QF5RTP' */

/* ### Deleting orders */

DELETE FROM 'order'
WHERE id = 5;
/* Deleted order '5' */

/* ### Deleting sellers */

DELETE FROM seller
WHERE email = 'vgarcia@hodge.com';
/* Deleted seller 'vgarcia@hodge.com' */

/* ### Deleting buyers */

DELETE FROM buyer
WHERE email = 'jenna75@gmail.com';
/* Deleted buyer 'jenna75@gmail.com' */
COMMIT
