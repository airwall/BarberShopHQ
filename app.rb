#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base 
	validates :name, presence: true
	validates :phone, presence: true
	validates :barber, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
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
	@c = Client.new 
	erb :visit
end

post '/visit' do
	@c = Client.new params[:client]
	if @c.save
		@alert = "Вы записанны!"
		erb :visit
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
end

get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end

get '/contacts' do
	erb :contacts
end

get '/about' do
	erb :about
end

get '/showusers' do

	@results = Client.order ('created_at DESC')
	erb :showusers
end

get '/client/:id' do
	@client = Client.find(params[:id])
	erb :client
end

