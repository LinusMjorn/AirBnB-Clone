require 'sinatra/base'
require './lib/space.rb'
require './lib/database_connection.rb'
require './lib/user'
require './lib/request'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/dashboard'


class Airbnb < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  before do
    @current_user = User.instance
  end

  get '/' do
    @spaces = Space.all
    erb (:view_index)
  end

  get '/dashboard' do
    if @current_user
      @spaces = Dashboard.all(@current_user.id)
    else
      flash[:not_logged_in]= "You are not logged in"
    end
    erb :dashboard
  end

  get '/dashboard/new' do
    erb :new_space
  end


  post '/dashboard/new' do
    # @current_user = User.instance
    Space.create(@current_user.id, params[:description], params[:price])
    redirect '/dashboard'

  end

  post '/signup' do

    if (!User.duplicated_username?(params[:username]) && User.unique_email?(params[:email]))
      @current_user = User.store(params[:password], params[:username], params[:username])
      redirect '/'
    else
      flash[:already_signed_up] = "Username or email is taken"
      redirect '/'
    end
  end

  post '/login' do
    if User.authenticate?(params[:login_username], params[:login_password])
      @current_user = User.create(params[:login_username])
      redirect '/'
    else 
      flash[:incorrect_login] = "Login details incorrect"
      redirect '/'
    end
  end

  post '/sessions/logout' do
    User.log_out
    flash[:logout]= "You have logged out"
    redirect '/'
  end

  get '/requests' do
    # @current_user = User.instance
    @requests = Request.my_requests(@current_user.id)
    erb :requests
  end

  get '/request/:id' do
    @id = params[:id]
    erb :new_request
  end

end