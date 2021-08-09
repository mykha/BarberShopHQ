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

get '/signup' do
  @barbers = Barber.order 'created_at DESC'
  erb :visit
end

post '/signup' do
  new_visit = Client.new
  new_visit.name = params[:person_name]
  new_visit.phone = params[:person_phone]
  new_visit.datestamp = params[:visit_date]
  new_visit.barber = Barber.find(params[:selected_barber])
  new_visit.color = params[:selected_color]
  new_visit.save
  @success_message = "Your visit successfuly saved"
  @barbers = Barber.order 'created_at DESC'
  erb :visit
end
