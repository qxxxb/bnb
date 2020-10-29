import sqlite3
import os

db_name = 'a.db'

os.remove(db_name)

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

# TODO: Rest of Q3

# """
# SELECT IP_Item.File_Name, Order.Timestamp
# FROM Order, Order_Contents, IP_Item
# WHERE Order_Contents.Order_No=Order.Order_No
#     AND Order_Contents.Serial_No=IP_Item.Serial_No
#     AND Order.Email = 'DesignatedBuyer@cp03.com';
# """

# """
# SELECT User.First_Name, User.Last_Name
# FROM User, Virtual_Store, IP_Item
# WHERE  User.Email = Virtual_Store.Email
#     AND Virtual_Store.Email = IP_Item.Email
#     AND Virtual_Store.Store_Name = IP_Item.Store_Name
# GROUP BY User.Email
# HAVING COUNT(IP_Item) < 5;
# """

# """
# SELECT O.Email, I.File_Name
# FROM Order_Contents AS OC, Order AS O, User AS U, IP_Item AS I
# WHERE I.Email = 'DesignatedSeller@cp03.com'
#     AND OC.Serial_No = I.Serial_No
#     AND OC.Order_No = O.Order_No
# """

# """
# SELECT COUNT(I.Serial_No)
# FROM IP_Item AS I, User AS U, Order AS O, Order_Contents AS OC
# WHERE I.Serial_No = OC.Serial_No
#     AND OC.Order_No = O.Order_No
#     AND O.Email = 'DesignatedBuyer@cp03.com'
# """


# """
# SELECT U.Email, COUNT(OC.Serial_No)
# FROM User AS U, Order AS O, Order_Contents AS OC
# WHERE U.Email = O.Email
#     AND O.Order_No = OC.Order_No
# GROUP BY U.Email
# HAVING COUNT(OC.Serial_No) =
# (SELECT MAX(count)
# FROM (SELECT COUNT(OC.Serial_No) AS count
# FROM User AS U, Order AS O, Order_Contents AS OC
# WHERE U.Email = O.Email
# AND O.Order_No = OC.Order_No
# GROUP BY U.Email
# """
