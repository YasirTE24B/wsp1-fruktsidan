require 'debug'
require "awesome_print"

class App < Sinatra::Base
    register Sinatra::Reloader

    def db
      return @db if @db

      @db = SQLite3::Database.new(DB_PATH)
      @db.results_as_hash = true

      return @db
    end

    #TODO: Skriv routen hämtar alla frukter i databasen
    
  get '/fruits' do
    @fruits = db.execute('SELECT * FROM products ORDER BY name ASC')
    ap @fruits
    erb(:"fruits/index")
  end

  get '/fruits/new' do
    erb(:"fruits/new")
  end

  get '/fruits/:id' do | id |
    @fruit = db.execute('SELECT * FROM products WHERE id=?',id).first
    ap @fruit
    erb(:"fruits/show")
  end

  get '/fruits' do
    @fruits = db.execute('SELECT * FROM products WHERE category_id = 1')
    erb(:"fruits/index")
  end

  get '/fruits' do
    @fruits = db.execute('SELECT * FROM products')
    erb(:"fruits/index")
  end

  get '/fruits/category/:category_id' do |category_id|
    @fruits = db.execute('SELECT * FROM products WHERE category_id = ?', category_id)
    erb(:"fruits/index")
  end

  get '/fruits/:id/edit' do |id|
    @fruit = db.execute('SELECT * FROM products WHERE id = ?', id).first
    erb(:"fruits/edit")
  end

  post '/fruits/:id/delete' do | id |
    db.execute("DELETE FROM products WHERE id =?", id)
    redirect("/fruits")
  end

  post '/fruits' do
    name = params["fruktnamn"]
    tastiness = params["tastiness"]
    description = params["beskrivning"]
    price = params["pris"]
    country = params["land"]

    db.execute('INSERT INTO products (name, tastiness, description, price, country) VALUES (?, ?, ?, ?, ?)', [name, tastiness, description, price, country])

    redirect('/fruits')
  end

  post '/fruits/:id/update' do |id|
    name = params["fruktnamn"]
    tastiness = params["tastiness"]
    description = params["beskrivning"]
    price = params["pris"]

    db.execute('UPDATE products SET name = ?, tastiness = ?, description = ?, price = ? WHERE id = ?', [name, tastiness, description, price, id])

    redirect("/fruits/#{id}")
  end
    
end