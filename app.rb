#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

set :database, "sqlite3:barbershop.db"

class Clients < Activerecord::Base 
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end