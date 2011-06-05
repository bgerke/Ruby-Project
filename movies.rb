require 'bundler/setup'
require 'sinatra'
require 'erb'
require 'datamapper'

get ('/add') do
	erb :add
end

get ('/collection') do
  @movies = Movie.all :order => :id.desc
  erb :collection
end

get ('/') do
	erb :main
end

get ('/:id') do
  @movie = Movie.get params[:id]
  erb :edit
end

get ('/:id/delete') do
  @movie = Movie.get params[:id]
  erb :delete
end

#DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/movies.db") #setting up new database name movies.db
DataMapper.setup(:default, ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/movies.db")

class Movie #DataMapper creates table called notes
  include DataMapper::Resource
  property :id, Serial
  property :title, Text, :required => true
  property :genre, Text, :required => true
  property :director, Text
  property :lead, Text
  property :complete, Boolean, :required => true, :default => false
end

DataMapper.finalize.auto_upgrade! #Tells Datamapper to automaticly update the database with changes made

post '/collection' do
  m = Movie.new
  m.title = params[:title]
  m.genre = params[:genre]
  m.director = params[:director]
  m.lead = params[:lead]
  m.save
  redirect '/collection'
end

delete '/:id' do
  m = Movie.get params[:id]
  m.destroy
  redirect '/'
end