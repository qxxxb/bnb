import sqlite3
import os
from faker import Faker
import random
import string

Faker.seed(1234)
random.seed(1234)

db_name = 'a.db'

try:
    os.remove(db_name)
except OSError:
    pass

conn = sqlite3.connect(db_name)
c = conn.cursor()

print('Creating database')
with open('create.sql', 'r') as f:
    s = f.read()
    c.executescript(s)
    print('Created database')

print()
print('Initializing database with data')

s = """
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
VALUES (?, ?, ?, ?, ?);
"""

fake = Faker()
users = [()] * 200
for i, user in enumerate(users):
    users[i] = (
        fake.email(), fake.first_name(), fake.last_name(),
        fake.boolean(), fake.pyint()
    )

c.executemany(s, users)

s = """
INSERT INTO card (
    card_no,
    pin,
    type,
    expire_month,
    expire_year
) VALUES (?, ?, ?, ?, ?);
"""

cards = [()] * 250
for i, card in enumerate(cards):
    expire = fake.credit_card_expire().split('/')
    month = int(expire[0])
    year = int(expire[1]) + 2000

    cards[i] = (
        fake.credit_card_number(),
        fake.credit_card_security_code(),
        fake.credit_card_provider(),
        month,
        year
    )

c.executemany(s, cards)

s = """
INSERT INTO buyer_card (email, card_no)
VALUES (?, ?);
"""

buyer_cards = set()
for i in range(180):
    user = random.choice(users)
    card = random.choice(cards)
    buyer_card = (user[0], card[0])
    if buyer_card not in buyer_cards:
        buyer_cards.add(buyer_card)

c.executemany(s, buyer_cards)

s = """
INSERT INTO seller (email)
VALUES (?);
"""

sellers = [(u[0],) for u in users]
random.shuffle(sellers)
sellers = sellers[:120]

c.executemany(s, sellers)

s = """
INSERT INTO buyer (email)
VALUES (?);
"""

buyers = [(u[0],) for u in users]
random.shuffle(buyers)
buyers = buyers[:180]

c.executemany(s, buyers)

s = """
INSERT INTO store (name, seller_email)
VALUES (?, ?);
"""

stores = [()] * 200
for i, _ in enumerate(stores):
    name = fake.company()
    seller = random.choice(sellers)[0]
    stores[i] = (name, seller)

c.executemany(s, stores)

s = """
INSERT INTO item (
    serial_no,
    quantity,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES (?, ?, ?, ?, ?, ?, ?, ?);
"""

items = [()] * 400
for i, _ in enumerate(items):
    # https://stackoverflow.com/a/2257449/6759699
    serial_no_len = random.randint(5, 20 + 1)
    serial_no = ''.join(
        random.choices(string.ascii_uppercase + string.digits, k=serial_no_len)
    )

    quantity = random.randint(1, 500 + 1)
    title = fake.bs()
    description = fake.sentence()

    categories = [
        'art', 'tools', 'images', 'documents', 'code',
        'books', 'music', 'games', 'misc'
    ]
    category = random.choice(categories)
    file_type = fake.file_extension()

    price = random.randint(1, 1000000 + 1)

    store = random.choice(stores)
    store_name = store[0]

    item = (
        serial_no, quantity, title, description, category,
        file_type, price, store_name
    )

    items[i] = item

c.executemany(s, items)

s_order = """
INSERT INTO 'order' (
    buyer_email,
    delivery_email,
    timestamp,
    card_no
) VALUES (?, ?, ?, ?);
"""

s_order_contents = """
INSERT INTO order_contents (order_id, serial_no, quantity)
VALUES (?, ?, ?);
"""

# I'm just going to pretend that we don't need to update the quantity sold.  If
# you need it you can uncomment it, but you should check that we're not buying
# more items than are supplied.

# s_quantity = """
# UPDATE item SET quantity_sold = quantity_sold + 1
# WHERE serial_no = ?;
# """

orders = [()] * 300
order_contents = []
# ordered_items = []
for i, _ in enumerate(orders):
    order_id = i + 1
    buyer = random.choice(buyers)[0]
    delivery_email = fake.email()
    timestamp = str(fake.date_time_this_decade())
    card_no = random.choice(cards)[0]
    order = (buyer, delivery_email, timestamp, card_no)
    orders[i] = order

    n_items = random.randint(1, 25 + 1)
    contents = [item[0] for item in items]
    random.shuffle(contents)
    contents = contents[:n_items]

    # ordered_items += [(item,) for item in contents]

    contents = [
        (order_id, item, random.randint(1, 20 + 1)) for item in contents
    ]
    order_contents += contents

c.executemany(s_order, orders)
c.executemany(s_order_contents, order_contents)
# c.executemany(s_quantity, ordered_items)

s = """
INSERT INTO store_review (
    store_name,
    reviewer_email,
    rating,
    review
) VALUES (?, ?, ?, ?);
"""

store_reviews = [()] * 100
for i, _ in enumerate(store_reviews):
    store = random.choice(stores)[0]
    reviewer_email = random.choice(buyers)[0]
    rating = random.randint(0, 5 + 1)
    review = fake.sentence()
    store_reviews[i] = (store, reviewer_email, rating, review)

c.executemany(s, store_reviews)

s = """
INSERT INTO wishlist (serial_no, email)
VALUES (?, ?);
"""

wishlists = [()] * 80
for i, _ in enumerate(wishlists):
    item = random.choice(items)[0]
    buyer = random.choice(buyers)[0]
    wishlists[i] = (item, buyer)

c.executemany(s, wishlists)

s = """
INSERT INTO item_review (
    serial_no,
    reviewer_email,
    rating,
    review
) VALUES (?, ?, ?, ?);
"""

keys = set()
item_reviews = []
for i in range(200):
    item = random.choice(items)[0]
    reviewer_email = random.choice(buyers)[0]
    key = (item, reviewer_email)
    if key not in keys:
        keys.add(key)
        rating = random.randint(0, 5 + 1)
        review = fake.sentence()
        item_reviews.append((item, reviewer_email, rating, review))

c.executemany(s, item_reviews)

s = """
INSERT INTO coupon (discount, serial_no, email) VALUES (?, ?, ?);
"""

coupons = [()] * 100
for i, _ in enumerate(coupons):
    discount = random.randint(1, 100 + 1)
    serial_no = random.choice(items)[0]
    email = random.choice(buyers)[0]
    coupons[i] = (discount, serial_no, email)

c.executemany(s, coupons)

s = """
INSERT INTO item_accepted_card (serial_no, card_type) VALUES (?, ?);
"""

item_accepted_cards = set()
for i in range(300):
    serial_no = random.choice(items)[0]
    card_type = random.choice(cards)[2]
    x = (serial_no, card_type)
    if x not in item_accepted_cards:
        item_accepted_cards.add(x)

s = """
INSERT INTO item_keyword (serial_no, keyword) VALUES (?, ?);
"""

keywords = fake.words(100)
keywords = list(filter(lambda x: len(x) > 3, keywords))

item_keywords = set()
for i in range(300):
    serial_no = random.choice(items)[0]
    keyword = random.choice(keywords)
    x = (serial_no, keyword)
    if x not in item_keywords:
        item_keywords.add(x)

c.executemany(s, item_keywords)

conn.commit()
conn.close()
