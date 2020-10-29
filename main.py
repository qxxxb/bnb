import sqlite3
import os

db_name = 'a.db'

try:
    os.remove(db_name)
except OSError:
    pass

conn = sqlite3.connect(db_name)
c = conn.cursor()

# Q2

with open('create.sql', 'r') as f:
    s = f.read()
    c.executescript(s)

with open('init.sql', 'r') as f:
    s = f.read()
    c.executescript(s)

# Q3

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
print(c.fetchall())

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
print(c.fetchall())

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
print(c.fetchall())

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
print(c.fetchall())

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
print(c.fetchall())

s = """
SELECT buyer.email, MAX(`COUNT(item.serial_no)`)
FROM buyer, (
    SELECT COUNT(item.serial_no)
        FROM buyer, buyer_order, item
        WHERE
            buyer.email = buyer_order.buyer_email AND
            item.buyer_order_id = buyer_order.id
        GROUP BY buyer.email
);
"""

c.execute(s)
print(c.fetchall())
