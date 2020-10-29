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

"""
SELECT O.Email, I.File_Name
FROM Order_Contents AS OC, Order AS O, User AS U, IP_Item AS I
WHERE I.Email = 'DesignatedSeller@cp03.com'
    AND OC.Serial_No = I.Serial_No
    AND OC.Order_No = O.Order_No
"""

"""
SELECT COUNT(I.Serial_No)
FROM IP_Item AS I, User AS U, Order AS O, Order_Contents AS OC
WHERE I.Serial_No = OC.Serial_No
    AND OC.Order_No = O.Order_No
    AND O.Email = 'DesignatedBuyer@cp03.com'
"""


"""
SELECT U.Email, COUNT(OC.Serial_No)
FROM User AS U, Order AS O, Order_Contents AS OC
WHERE U.Email = O.Email
    AND O.Order_No = OC.Order_No
GROUP BY U.Email
HAVING COUNT(OC.Serial_No) =
(SELECT MAX(count)
FROM (SELECT COUNT(OC.Serial_No) AS count
FROM User AS U, Order AS O, Order_Contents AS OC
WHERE U.Email = O.Email
AND O.Order_No = OC.Order_No
GROUP BY U.Email
"""
