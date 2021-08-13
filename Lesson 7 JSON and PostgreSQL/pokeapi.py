import requests
import psycopg2
import hidden

secret = hidden.secrets()

connection = psycopg2.connect(
    database = secret['database'],
    user = secret['user'],
    password = secret['pass'],
    host = secret['host'],
    port = secret['port']
)

cursor = connection.cursor()

sql = """
CREATE TABLE IF NOT EXISTS pokeapi (
    id INTEGER,
    body JSONB,
    status INTEGER
);
"""

cursor.execute(sql)

items = ['ability', 'berry', 'item']

item = items.pop()

for number in range(1,101):
    url = f"https://pokeapi.co/api/v2/{item}/{number}"

    print(url)

    response = requests.get(url)

    print(response.status_code)

    if response.status_code != 200:
        item = items.pop()
        continue

    sql = 'INSERT INTO pokeapi (id, body, status) VALUES (%s, %s, %s);'

    cursor.execute(sql, (number, response.text, response.status_code))

    connection.commit()

cursor.close()
connection.close()