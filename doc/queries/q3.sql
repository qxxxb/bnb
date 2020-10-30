/* (3.a) Find the titles of all items by a given seller that cost less */
/* than $10 */

SELECT item.title
FROM item, store, seller
WHERE
    seller.email = ? AND
    seller.email = store.seller_email AND
    store.name = item.store_name AND
    item.price < 1000;

/* (3.b) Give all titles and their dates of purchase made by a given buyer */

SELECT item.title, 'order'.timestamp
FROM buyer, 'order', order_contents, item
WHERE
    buyer.email = ? AND
    buyer.email = 'order'.buyer_email AND
    'order'.id = order_contents.order_id AND
    order_contents.serial_no = item.serial_no;

/* (3.c) Find seller names with less than 5 items for sale */

SELECT user.first_name, user.last_name, SUM(item.quantity)
FROM user, store, item
WHERE
    user.email = store.seller_email AND
    item.store_name = store.name
GROUP BY user.email
HAVING SUM(item.quantity) < 5;

/* (3.d) Give all buyers who purchased an item by a given seller and the */
/* names of the items they purchased */

SELECT 'order'.buyer_email, item.title
FROM seller, store, item, order_contents, 'order'
WHERE
    seller.email = ? AND
    seller.email = store.seller_email AND
    store.name = item.store_name AND
    item.serial_no = order_contents.serial_no AND
    order_contents.order_id = 'order'.id;

/* (3.e) Find the total number of items purchased by a given buyer */

SELECT SUM(order_contents.quantity)
FROM buyer, 'order', order_contents
WHERE
    buyer.email = ? AND
    buyer.email = 'order'.buyer_email AND
        'order'.id = order_contents.order_id;

/* (3.f) Find the buyer who purchased the most number of items */

SELECT email, MAX('SUM(order_contents.quantity)')
FROM (
    SELECT buyer.email, SUM(order_contents.quantity)
    FROM buyer, 'order', order_contents
    WHERE
        buyer.email = 'order'.buyer_email AND
        'order'.id = order_contents.order_id
    GROUP BY buyer.email
);
