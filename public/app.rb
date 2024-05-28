require 'sinatra'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "db/development.sqlite3"}

class Book < ActiveRecord::Base
end

# Create
post '/books' do
  book = Book.new(params[:book])
  if book.save
    redirect '/books'
  else
    "Error saving book"
  end
end

# Read
get '/books' do
  @books = Book.all
  erb :index
end

get '/books/:id' do
  @book = Book.find(params[:id])
  erb :show
end

# Update
put '/books/:id' do
  book = Book.find(params[:id])
  if book.update(params[:book])
    redirect '/books'
  else
    "Error updating book"
  end
end

# Delete
delete '/books/:id' do
  book = Book.find(params[:id])
  book.destroy
  redirect '/books'
end
