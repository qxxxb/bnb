import sqlite3
import pprint
import os

pp = pprint.PrettyPrinter(indent=4)

db_name = 'a.db'

try:
    os.remove(db_name)
except OSError:
    pass

conn = sqlite3.connect(db_name)
c = conn.cursor()

# Q2

print('# Question 2')
print()

with open('create.sql', 'r') as f:
    s = f.read()
    c.executescript(s)
    print('Created database')

with open('init.sql', 'r') as f:
    s = f.read()
    c.executescript(s)
    print('Initialized database with sample data')


# Q3
print()
print('# Question 3')
print()

print(
    '(3.a) Find the titles of all items by a given seller that cast less '
    'than $10'
)

seller = "johndoe@gmail.com"
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

buyer = "janedoe@gmail.com"
s = """
SELECT item.title, buyer_order.timestamp
FROM item, buyer_order, buyer
WHERE
    buyer.email = ? AND
    buyer.email = buyer_order.buyer_email AND
    item.buyer_order_id = buyer_order.id;
"""

c.execute(s, (buyer,))
pp.pprint(c.fetchall())
print()

print(
    '(3.c) Find seller names with less than 5 items for sale'
)

s = """
SELECT user.first_name, user.last_name
FROM user, store, item
WHERE
    user.email = store.seller_email AND
    item.store_name = store.name
GROUP BY user.email
HAVING COUNT(item.serial_no) < 5;
"""

c.execute(s)
print()

print(
    '(3.d) Give all buyers who purchased an item by a given seller and the'
    'names of the items they purchased'
)

seller = "johndoe@gmail.com"
s = """
SELECT buyer.email, item.title
FROM seller, store, item, buyer_order, buyer
WHERE
    seller.email = ? AND
    seller.email = store.seller_email AND
    store.name = item.store_name AND
    item.buyer_order_id = buyer_order.id AND
    buyer_order.buyer_email = buyer.email;
"""

c.execute(s, (seller,))
print()

print(
    '(3.e) Find the total number of items purchased by a given buyer'
)

buyer = "janedoe@gmail.com"
s = """
SELECT COUNT(item.serial_no)
FROM buyer, buyer_order, item
WHERE
    buyer.email = ? AND
    buyer.email = buyer_order.buyer_email AND
    item.buyer_order_id = buyer_order.id;
"""

c.execute(s, (buyer,))
pp.pprint(c.fetchall())
print()

print(
    '(3.f) Find the buyer who purchased the most number of items'
)

s = """
SELECT email, MAX(`COUNT(item.serial_no)`)
FROM (
    SELECT buyer.email, COUNT(item.serial_no)
    FROM buyer, buyer_order, item
    WHERE
        buyer.email = buyer_order.buyer_email AND
        item.buyer_order_id = buyer_order.id
    GROUP BY buyer.email
);
"""

c.execute(s)
pp.pprint(c.fetchall())

# TODO: Q4

# Q5
print()
print('# Question 5')
print()

print('(5.a) List of buyer names with total dollar amount spent')

s = """
SELECT
    user.first_name,
    user.last_name,
    ROUND(SUM(item.price / 100.0), 2) dollars_spent
FROM user, buyer, buyer_order, item
WHERE
    user.email = buyer.email AND
    buyer.email = buyer_order.buyer_email AND
    buyer_order.id = item.buyer_order_id
GROUP BY user.email;
"""

c.execute(s)
pp.pprint(c.fetchall())
