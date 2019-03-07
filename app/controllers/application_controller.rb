#require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security" #creates a session id for each session giving an extra layer of security
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      # true if the user is logged in, otherwise false
      !!current_user
    end

    def current_user
      @current_user || = User.find_by(id: session[:user_id])
    end
  end
end


  #get '/show' do
    #"Hello World"
  #end

  #get '/login' do
    #erb :index
  #end

end
