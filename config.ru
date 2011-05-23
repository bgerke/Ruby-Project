require 'sinatra'
require 'movies'
require 'datamapper'

require File.join(File.dirname(__FILE__), 'movies')

run Sinatra::Application