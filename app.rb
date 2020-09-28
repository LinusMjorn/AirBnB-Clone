require 'sinatra/base'
require './lib/space.rb'
require './lib/database_connection.rb'

class Airbnb < Sinatra::Base

  get '/' do
    erb (:view_index)
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    @spaces = Space.all
    erb :spaces
  end

end