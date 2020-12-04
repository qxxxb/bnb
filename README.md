# CSE 3241 Project

## Dependencies

- Install Python 3
- Install [Faker](https://github.com/joke2k/faker)
```
pip3 install Faker
```

## Initializing the database

An initialized database can be found in [a.db](a.db). If you would like to
re-initialize the database, there are two methods.

### Method 1 (Recommmended)

Execute the [init.py](init.py) script:
```
python3 init.py
```

This creates tables and initializes them with dummy data.
The new database is stored in [a.db](a.db).
This is the recommended method because it is extremely fast.

### Method 2

If method 1 doesn't work, you can create a new database and execute
these SQL scripts:
1. [queries/create.sql](queries/create.sql)
  (create tables)
2. [queries/init.sql](queries/init.sql)
  (insert data, may take a long time to run)

## Sample queries

### Method 1 (Recommended)

To execute queries from the CPs as well as various insert/delete queries, run
[main.py](main.py):
```
python3 main.py
```

### Method 2

If method 1 doesn't work, you can manually execute these SQL
scripts:
1. [queries/cp.sql](queries/cp.sql)
  (various queries from CPs)
4. [queries/insert.sql](queries/insert.sql)
  (inserting items, orders, sellers, and buyers)
5. [queries/delete.sql](queries/delete.sql)
  (deleting items, orders, sellers, and buyers)
