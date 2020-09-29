require 'sinatra/base'
require './lib/space.rb'
require './lib/database_connection.rb'
require './lib/user'
require 'sinatra/flash'

class Airbnb < Sinatra::Base
  register Sinatra::Flash

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

  post '/signup' do
    if (!User.duplicated_username?(params[:username]) && User.unique_email?(params[:email]))
      User.store(params[:password], params[:username], params[:username])
      redirect '/'
    else
      flash[:already_signed_up] = "Username or email is taken"
      redirect '/'
    end
  end

  post '/login' do
    if User.authenticate?(params[:username], params[:password])
      redirect '/spaces'
    else 
      flash[:incorrect_login] = "Login details incorrect"
      redirect '/'
    end
  end
end