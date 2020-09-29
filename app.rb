require 'sinatra/base'
require './lib/space.rb'
require './lib/database_connection.rb'
require './lib/user'
require 'sinatra/flash'
require './database_connection_setup'


class Airbnb < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb (:view_index)
  end

  get '/spaces' do
    @current_user = session[:current_user]
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
    if User.authenticate?(params[:login_username], params[:login_password])
      session[:current_user] = params[:login_username]
      redirect '/spaces'
    else 
      flash[:incorrect_login] = "Login details incorrect"
      redirect '/'
    end
  end
end