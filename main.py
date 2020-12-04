import sqlite3
import pprint
import string
from faker import Faker
import random
import init

Faker.seed(4321)
random.seed(4321)

init.init()

pp = pprint.PrettyPrinter(indent=4)

db_name = 'a.db'

conn = sqlite3.connect(db_name)
c = conn.cursor()

sql_log = open('main_log.sql', 'w')


def conn_trace(s):
    sql_log.write(s.strip() + '\n')


def log(s=''):
    print(s)
    if s == '':
        sql_log.write('\n')
    else:
        sql_log.write('/* ' + s + ' */\n')


conn.set_trace_callback(conn_trace)

log('# CP 3')
log()

log('## Question 3')
log()

log(
    '(3.a) Find the titles of all items by a given seller that cost less '
    'than $10'
)

seller = "bartonshelley@hotmail.com"
s = """
SELECT item.title
FROM item, store, seller
WHERE
    seller.email = ? AND
    seller.email = store.seller_email AND
    store.name = item.store_name AND
    item.price < 1000;
"""

c.execute(s, (seller,))
pp.pprint(c.fetchall())
log()

log(
    '(3.b) Give all titles and their dates of purchase made by a given buyer'
)

buyer = "klinelinda@gallegos.org"
s = """
SELECT item.title, 'order'.timestamp
FROM buyer, 'order', order_contents, item
WHERE
    buyer.email = ? AND
    buyer.email = 'order'.buyer_email AND
    'order'.id = order_contents.order_id AND
    order_contents.serial_no = item.serial_no;
"""

c.execute(s, (buyer,))
pp.pprint(c.fetchall())
log()

log(
    '(3.c) Find seller names with less than 10 items for sale'
)

s = """
SELECT user.first_name, user.last_name, SUM(item.quantity)
FROM user, store, item
WHERE
    user.email = store.seller_email AND
    item.store_name = store.name
GROUP BY user.email
HAVING SUM(item.quantity) < 10;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(3.d) Give all buyers who purchased an item by a given seller and the '
    'names of the items they purchased'
)

seller = "lindsayspencer@wyatt.biz"
s = """
SELECT 'order'.buyer_email, item.title
FROM seller, store, item, order_contents, 'order'
WHERE
    seller.email = ? AND
    seller.email = store.seller_email AND
    store.name = item.store_name AND
    item.serial_no = order_contents.serial_no AND
    order_contents.order_id = 'order'.id;
"""

c.execute(s, (seller,))
pp.pprint(c.fetchall())
log()

log(
    '(3.e) Find the total number of items purchased by a given buyer'
)

buyer = "klinelinda@gallegos.org"
s = """
SELECT buyer.email, SUM(order_contents.quantity)
FROM buyer, 'order', order_contents
WHERE
    buyer.email = ? AND
    buyer.email = 'order'.buyer_email AND
        'order'.id = order_contents.order_id;
"""

c.execute(s, (buyer,))
pp.pprint(c.fetchall())
log()

log(
    '(3.f) Find the buyer who purchased the most number of items'
)

s = """
SELECT email, MAX(`SUM(order_contents.quantity)`)
FROM (
    SELECT buyer.email, SUM(order_contents.quantity)
    FROM buyer, 'order', order_contents
    WHERE
        buyer.email = 'order'.buyer_email AND
        'order'.id = order_contents.order_id
    GROUP BY buyer.email
);
"""

c.execute(s)
pp.pprint(c.fetchall())

log()
log('## Question 4')
log()

log('(4.a) List stores with an average rating above 2')

s = """
SELECT store.name, AVG(rating)
FROM store, store_review
WHERE store.name = store_review.store_name
GROUP BY store.name
HAVING AVG(rating) > 2;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log('(4.b) List items and prices of a user\'s wishlist')

buyer = 'vgarcia@hodge.com'
s = """
SELECT buyer.email, item.title, item.price
FROM buyer, wishlist, item
WHERE
    buyer.email = ? AND
    buyer.email = wishlist.email AND
    wishlist.serial_no = item.serial_no;
"""

c.execute(s, (buyer, ))
pp.pprint(c.fetchall())
log()

log('(4.c) Get the sum of item prices on all wishlists, ordered by price')

s = """
SELECT user.email, SUM(item.price)
FROM user, wishlist, item
WHERE
    user.email = wishlist.email AND
    wishlist.serial_no = item.serial_no
GROUP BY user.email
ORDER BY SUM(item.price) ASC;
"""

c.execute(s)
pp.pprint(c.fetchall())

# Q5
log()
log('## Question 5')
log()

log('(5.a) List of buyer names with total dollar amount spent')

s = """
SELECT
    buyer.email,
    ROUND(SUM(item.price) * order_contents.quantity / 100.0, 2)
FROM buyer, 'order', order_contents, item
WHERE
    buyer.email = 'order'.buyer_email AND
    'order'.id = order_contents.order_id AND
    order_contents.serial_no = item.serial_no
GROUP BY buyer.email;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(5.b) List buyers names and emails who have spent more than the '
    'average buyer'
)

s = """
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
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(5.c) List all item names and their total copies sold, sorted from '
    'most copies sold to least'
)

s = """
SELECT item.title, SUM(quantity_sold)
FROM item
LEFT JOIN order_contents ON item.serial_no = order_contents.serial_no
GROUP BY item.serial_no
ORDER BY SUM(quantity_sold) DESC;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(5.d) Provide a list of item names and associated dollar totals for '
    'copies sold to all buyers, sorted from highest dollar amount to lowest'
)

s = """
SELECT
    item.title,
    SUM(quantity_sold),
    SUM(quantity_sold) * item.price as accum_price
FROM item
LEFT JOIN order_contents ON item.serial_no = order_contents.serial_no
GROUP BY item.serial_no
ORDER BY accum_price DESC;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(5.e) Find the seller who sold the most items'
)

s = """
SELECT email, MAX(total_quantity_sold) FROM (
    SELECT seller.email, SUM(quantity_sold) AS total_quantity_sold
    FROM seller, store, item
    WHERE
        seller.email = store.seller_email AND
        store.name = item.store_name
    GROUP BY seller.email
    ORDER BY SUM(quantity_sold) DESC
);
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(5.f) Find the most profitable seller'
)

s = """
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
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(5.g) List buyer names who have purchased from the most profitable seller'
)

s = """
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
    order_contents.order_id = 'order'.id;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(5.h) List sellers who listed items purchased by the buyers who spent '
    'above average'
)

s = """
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
    store.seller_email = seller.email;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log('# CP 4')
log()

log('## Question 5')
log()

# See `init.py` for SQL code used to create views

log(
    '(5.a) We created a view that lists all items along with their average '
    'rating.'
)

s = """
SELECT * FROM avg_item_rating;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log(
    '(5.b) We created a view that lists all orders along with their total '
    'price of items purchased'
)

s = """
SELECT * FROM order_price;
"""

c.execute(s)
pp.pprint(c.fetchall())
log()

log('## Question 7')
log()

log(
    '(7.a) Sample transaction for placing an order'
)

order_id = 301

s = """
BEGIN TRANSACTION;
    INSERT OR ROLLBACK INTO 'order' (
        id,
        buyer_email,
        delivery_email,
        card_no
    ) VALUES (
        {order_id},
        '{buyer_email}',
        '{delivery_email}',
        '{card_no}'
    );

    INSERT OR ROLLBACK INTO order_contents (
        order_id,
        serial_no,
        quantity
    ) VALUES (
        {order_id},
        '{serial_no1}',
        {quantity1}
    );

    UPDATE or ROLLBACK item
    SET
        quantity = quantity - {quantity1},
        quantity_sold = quantity_sold + {quantity1}
    WHERE serial_no = '{serial_no1}';

    INSERT OR ROLLBACK INTO order_contents (
        order_id,
        serial_no,
        quantity
    ) VALUES (
        {order_id},
        '{serial_no2}',
        {quantity2}
    );

    UPDATE or ROLLBACK item
    SET
        quantity = quantity - {quantity2},
        quantity_sold = quantity_sold + {quantity2}
    WHERE serial_no = '{serial_no2}';

END TRANSACTION;
""".format(
    order_id=order_id,
    buyer_email='klinelinda@gallegos.org',
    delivery_email='johndoe@gmail.com',
    card_no='4645029277102275',
    serial_no1='XMMDEQZECUBMWVS8',
    quantity1=2,
    serial_no2='GF4IPWZXNXZNUJM',
    quantity2=5
)

c.executescript(s)

s = """
SELECT id, buyer_email, delivery_email, timestamp
FROM 'order'
WHERE id = ?;
"""

c.execute(s, (order_id,))
pp.pprint(c.fetchall())
log()

log(
    '(7.b) Sample transaction for creating a store'
)

seller = 'hsolomon@cobb.com'

s = """
BEGIN TRANSACTION;
    INSERT OR IGNORE INTO seller (email)
    VALUES ('{seller}');

    INSERT OR ROLLBACK INTO store (name, seller_email)
    VALUES ('{store_name}', '{seller}');
END TRANSACTION;
""".format(
    seller=seller,
    store_name='Costco Hotdogs'
)

c.executescript(s)

s = """
SELECT seller_email, name
FROM store
WHERE store.seller_email = ?;
"""

c.execute(s, (seller,))
pp.pprint(c.fetchall())
log()

log('# Final document')
log()

fake = Faker()

log('## Inserting records')
log()

log('### Inserting items')
log()

s = """
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
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
"""

serial_no_len = random.randint(5, 20 + 1)
serial_no = ''.join(
    random.choices(
        string.ascii_uppercase + string.digits,
        k=serial_no_len
    )
)

quantity = random.randint(1, 50 + 1)
quantity_sold = random.randint(1, 50 + 1)
title = fake.bs()
description = fake.sentence()

categories = [
    'art', 'tools', 'images', 'documents', 'code',
    'books', 'music', 'games', 'misc'
]
category = random.choice(categories)
file_type = fake.file_extension()

price = random.randint(1, 10000 + 1)

store_name = 'Ross PLC'

item = (
    serial_no, quantity, quantity_sold, title, description, category,
    file_type, price, store_name
)

c.execute(s, item)
log(
    "Inserted new item '{}' with serial number '{}' in store '{}'".format(
        title,
        serial_no,
        store_name
    )
)
log()

log('### Inserting orders')
log()

log('See CP4 quesiton 7.a')
log()

log('### Inserting sellers')
log()

s = """
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
VALUES (?, ?, ?, ?, ?);
"""

user = (
    fake.email(), fake.first_name(), fake.last_name(),
    fake.boolean(), fake.pyint()
)

c.execute(s, user)
log(
    "Inserted user '{} {}' with email '{}'".format(
        user[1], user[2], user[0]
    )
)

s = """
INSERT INTO seller (email)
VALUES (?);
"""

seller = user[0]
c.execute(s, (seller,))
log("Inserted seller '{}'".format(seller))
log()

log('### Inserting buyers')
log()

s = """
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
VALUES (?, ?, ?, ?, ?);
"""

user = (
    fake.email(), fake.first_name(), fake.last_name(),
    fake.boolean(), fake.pyint()
)

c.execute(s, user)
log(
    "Inserted user '{} {}' with email '{}'".format(
        user[1], user[2], user[0]
    )
)

s = """
INSERT INTO buyer (email)
VALUES (?);
"""

buyer = user[0]
c.execute(s, (buyer,))
log("Inserted buyer '{}'".format(buyer))
log()

log('## Deleting records')
log()

log('### Deleting items')
log()

s = """
DELETE FROM item
WHERE serial_no = ?;
"""

serial_no = '13QF5RTP'

c.execute(s, (serial_no,))
log("Deleted item '{}'".format(serial_no))
log()

log('### Deleting orders')
log()

s = """
DELETE FROM 'order'
WHERE id = ?;
"""

order_id = 5

c.execute(s, (order_id,))
log("Deleted order '{}'".format(order_id))
log()

log('### Deleting sellers')
log()

s = """
DELETE FROM seller
WHERE email = ?;
"""

seller = 'vgarcia@hodge.com'

c.execute(s, (seller,))
log("Deleted seller '{}'".format(seller))
log()

log('### Deleting buyers')
log()

s = """
DELETE FROM buyer
WHERE email = ?;
"""

buyer = 'jenna75@gmail.com'

c.execute(s, (buyer,))
log("Deleted buyer '{}'".format(buyer))

conn.commit()
conn.close()

sql_log.close()
