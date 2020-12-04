import sqlite3
import pprint

pp = pprint.PrettyPrinter(indent=4)

db_name = 'a.db'

conn = sqlite3.connect(db_name)
c = conn.cursor()

# TODO: CP 2

print('# CP 3')
print()

# Q3
# TODO: Update these queries
print()
print('## Question 3')
print()

print(
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
print()

print(
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
print()

print(
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
print()

print(
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
print()

print(
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
print()

print(
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

# Q4
print()
print('## Question 4')
print()

print('(4.a) List stores with an average rating above 2')

s = """
SELECT store.name, AVG(rating)
FROM store, store_review
WHERE store.name = store_review.store_name
GROUP BY store.name
HAVING AVG(rating) > 2
"""

c.execute(s)
pp.pprint(c.fetchall())
print()

print('(4.b) List items and prices of a user\'s wishlist')

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
print()

print('(4.c) Get the sum of item prices on all wishlists, ordered by price')

s = """
SELECT user.email, SUM(item.price)
FROM user, wishlist, item
WHERE
    user.email = wishlist.email AND
    wishlist.serial_no = item.serial_no
GROUP BY user.email
ORDER BY SUM(item.price) ASC
"""

c.execute(s)
pp.pprint(c.fetchall())

# Q5
print()
print('## Question 5')
print()

print('(5.a) List of buyer names with total dollar amount spent')

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
print()

print(
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
print()

print(
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
print()

print(
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
print()

print(
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
print()

print(
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
print()

print(
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
    order_contents.order_id = 'order'.id
"""

c.execute(s)
pp.pprint(c.fetchall())
print()

print(
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
    store.seller_email = seller.email
"""

c.execute(s)
pp.pprint(c.fetchall())
