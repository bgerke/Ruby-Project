require 'sinatra'
require 'movies'
require 'datamapper'
require 'rubygems'
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://movies.db')

run Sinatra::Application