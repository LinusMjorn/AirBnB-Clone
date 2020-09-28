require 'sinatra/base'

class Airbnb < Sinatra::Base

  get '/' do
    erb (:view_index)
  end

end