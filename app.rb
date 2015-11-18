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

get '/' do
	erb :index
end

get '/visit' do
	@barbers = Barber.all
	erb :visit
end

post '/visit' do
	@barbers = Barber.all

	@name = params[:name]
	@phone = params[:phone]
	@barber = params[:barber]
	@datestamp = params[:datestamp]
	@color = params[:color]	
	# Первый варьянт записи в ьаблицу ==========
	# Client.create :name => @name, :phone => @phone, :barber => @barber,
	# 				:datestamp => @datestamp, :color => @color
	# =========================
	# втрой вырьянт записи в таблицу ==========
	c = Client.new
	c.name = @name
	c.phone = @phone
	c.barber = @barber
	c.datestamp = @datestamp
	c.color = @color
	c.save

	erb :visit
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
