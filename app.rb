#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base 
end

class Barber < ActiveRecord::Base 
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	c = Client.new params[:client]
	c.save
end



get '/contacts' do
	erb :contacts
end

get '/about' do
	erb :about
end

get '/showusers' do
	erb :showusers
end
