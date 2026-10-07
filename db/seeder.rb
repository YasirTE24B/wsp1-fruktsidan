require 'sqlite3'
require_relative '../config'

db = SQLite3::Database.new(DB_PATH)

puts "🧹 Tar bort gamla tabeller..."
db.execute('DROP TABLE IF EXISTS products')
db.execute('DROP TABLE IF EXISTS categories')

puts "🧱 Skapar tabeller..."
db.execute('CREATE TABLE categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL)')

db.execute('CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            tastiness INTEGER,
            description TEXT,
            price INTEGER,
            country TEXT,
            category_id INTEGER)')

puts "kategorier"
db.execute('INSERT INTO categories (name) VALUES ("Frukt med frön")')
db.execute('INSERT INTO categories (name) VALUES ("Stenfrukt")')
db.execute('INSERT INTO categories (name) VALUES ("Extra")')

puts "🍎 Fyller på med data..."

db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Äpple", 7, "En rund frukt som finns i många olika färger.", 10, 1)')
db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Päron", 6, "En nästan rund, men lite avlång, frukt. Oftast mjukt fruktkött.", 22, 1)')
db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Vattenmelon", 10, "Gött", 50, 1)')
db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Citron", 8, "Sur", 8, 1)')
db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Granatäpple", 8, "Sur som fan ibland men gott", 6767, 1)')


db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Mango", 9, "En god frukt med stor kärna.", 67, 2)')


db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Banan", 4, "En avlång gul frukt.", 30, 3)')
db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Jordgubbe", 10, "Röd", 45, 3)')
db.execute('INSERT INTO products (name, tastiness, description, price, category_id) VALUES ("Ananas", 4, "På pizza", 35, 3)')

puts "✅ Databasen är seedad!"