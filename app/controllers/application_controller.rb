require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security" #creates a session id for each session giving an extra layer of security
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end



  helpers do

    def logged_in?
      # true if the user is logged in, otherwise false
      !!current_user
    end

    def current_user #this method finds the current user by their session id and stores it as an instance variable
    @current_user ||= User.find_by(id: session[:user_id]) #instance of application controller; instance scope; or =, this saves calls to the database by storing an instance for a user that's already found and logged in.
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
    end
  end

  end
end
