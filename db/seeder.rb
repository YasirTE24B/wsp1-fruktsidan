require 'sqlite3'
require_relative '../config'

db = SQLite3::Database.new(DB_PATH)

puts "🧹 Tar bort gamla tabeller..."
db.execute('DROP TABLE IF EXISTS products')

puts "🧱 Skapar tabeller..."
db.execute('CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            tastiness INTEGER,
            description TEXT,
            price INTEGER)')

puts "🍎 Fyller på med data..."
db.execute('INSERT INTO products (name, tastiness, description, price) VALUES ("Äpple",  7, "En rund frukt som finns i många olika färger.", 10)')
db.execute('INSERT INTO products (name, tastiness, description, price) VALUES ("Päron",  6, "En nästan rund, men lite avlång, frukt. Oftast mjukt fruktkött.", 22)')
db.execute('INSERT INTO products (name, tastiness, description, price) VALUES ("Banan",  4, "En avlång gul frukt.", 30)')
db.execute('INSERT INTO products (name, tastiness, description, price) VALUES ("Mango",  9, "En god frukt med stor kärna.", 67)')


db.execute('INSERT INTO products (name, tastiness, description, price) VALUES ("Granatäpple", 10, "Sur som fan ibland men gott", 6767)')

puts "✅ Databasen är seedad!"
