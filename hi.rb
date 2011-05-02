require 'sinatra'
require 'erb'

get ('/add') do
	erb :add
end

get ('/collection') do
  erb :collection
end

get ('/') do
	erb :main
end

