require 'sinatra/base'
require './lib/space'
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
    space = Space.create(@current_user.id, params[:name], params[:description], params[:price])              #the below exception is to avoid it breaking rspec tests, we have been unable to get capybara to fill in date fields
    Space.add_dates(space.id, params[:start_date], params[:end_date])  unless params[:start_date].length.zero? #if time, refactor this method to be completed within space.create
    redirect '/dashboard'
  end

  post '/signup' do

    if (!User.duplicated_username?(params[:username]) && User.unique_email?(params[:email]))
      @current_user = User.store(params[:password], params[:username], params[:email])
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
    @requests = Request.my_requests(@current_user.id)
    @requests_for = Request.my_requests_for(@current_user.id)
    erb :requests
  end

  get '/request/:id' do
    @space = Space.find(params[:id])
    erb :new_request
  end

  post '/sent/request/:id' do

    @space = Space.find(params[:id])
    if Space.space_available?(@space.id, params[:booking_date])
      #DatabaseConnection.query("DELETE FROM available_dates WHERE available_date = #{params[:booking_date]} AND space_id = '#{@space.id}';") not needed till aproval 
      Request.create(params[:booking_date], @current_user.id, @space.id)
      flash[:date_requested] = "#{@space.description} has been requested for #{params[:booking_date]}"
      redirect"/"
    else 
      flash[:date_unavailable] = "Date already booked please select one of these: #{@space.available_dates}"
      redirect'/'
    end
  end


end