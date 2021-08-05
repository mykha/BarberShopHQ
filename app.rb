require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#set :database, 'sqlite3:barbershop.db'
set :database, {:adapter =>'sqlite3', :database=>'barbershop.db'}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do
  @barbers = Barber.order 'created_at DESC'
  erb :index
end

get '/about' do
  @message = 'There should be information about us'
  erb :message
  #erb "<div class=\"jumbotron text-center\"> About us information </div><h1></h1>"
end
