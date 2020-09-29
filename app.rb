require 'sinatra/base'
require './lib/space.rb'
# require './lib/database_connection.rb'
require './database_connection_setup'

class Airbnb < Sinatra::Base

  get '/' do
    erb (:view_index)
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces/new' do
    @userid = 75
    Space.create(@userid, params[:description], params[:price])
    redirect '/spaces'
  end

end