/* (5.a) List of buyer names with total dollar amount spent */

SELECT
    user.email,
    ROUND(SUM(item.price) * order_contents.quantity / 100.0, 2)
FROM user, buyer, 'order', order_contents, item
WHERE
    user.email = buyer.email AND
    buyer.email = 'order'.buyer_email AND
    'order'.id = order_contents.order_id AND
    order_contents.serial_no = item.serial_no
GROUP BY user.email;

/* (5.b) List buyers names and emails who have spent more than the */
/* average buyer */

SELECT
    user.first_name,
    user.last_name,
    user.email
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
);

/* (5.c) List all item names and their total copies sold, sorted from */
/* most copies sold to least */

SELECT item.title, SUM(quantity_sold)
FROM item
LEFT JOIN order_contents ON item.serial_no = order_contents.serial_no
GROUP BY item.serial_no
ORDER BY SUM(quantity_sold) DESC;

/* (5.d) Provide a list of item names and associated dollar totals for */
/* copies sold to all buyers, sorted from highest dollar amount to lowest */

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

/* (5.h) List sellers who listed items purchased by the buyers who spent */
/* above average */

SELECT email
FROM seller, store, item
WHERE
    seller.email = store.seller_email AND
    store.name = item.store_name AND
    item.serial_no = (
        SELECT item.serial_no
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
