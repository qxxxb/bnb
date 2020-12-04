import sqlite3
import os
from pathlib import Path
import init
import sys

use_init_script = len(sys.argv) >= 2

if use_init_script:
    db_name = 'test.db'
    try:
        os.remove(db_name)
    except OSError:
        pass
else:
    db_name = 'a.db'
    init.init()

conn = sqlite3.connect(db_name)
c = conn.cursor()

if use_init_script:
    print('Creating database')
    s = open(Path('queries') / 'create.sql').read()
    c.executescript(s)
    print('Created database')
    print()

    print('Initializing database with data')
    s = open(Path('queries') / 'init.sql').read()
    c.executescript(s)
    print('Initialized database with data')

print()

print('Running CP queries')
s = open(Path('queries') / 'cp.sql').read()
c.executescript(s)
print('Ran CP queries')
print()

print('Running insert queries')
s = open(Path('queries') / 'insert.sql').read()
c.executescript(s)
print('Ran insert queries')
print()

print('Running delete queries')
s = open(Path('queries') / 'delete.sql').read()
c.executescript(s)
print('Ran delete queries')
print()

conn.commit()
conn.close()

if use_init_script:
    os.remove(db_name)
