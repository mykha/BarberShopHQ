require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#set :database, 'sqlite3:barbershop.db'
set :database, { :adapter =>'sqlite3', :database=>'barbershop.db' }

class Client < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :color, presence: true
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
  @new_visit = Client.new
  erb :visit
end

get '/barber/:barber_id' do
  @bar = Barber.find params[:barber_id]
  erb '<h1> <%=@bar.name%> </h1>'
end


post '/signup' do
  pp = params[:client]
  @new_visit = Client.new pp
  @new_visit.save
  if @new_visit.valid?
    @success_message = 'Your visit successfuly saved'
  else
    @error = @new_visit.errors.full_messages.first
  end
  @barbers = Barber.order 'created_at DESC'
  erb :visit
end
