class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_book_club"
  end

  get '/' do
    if logged_in?
      "Logged in"
    else
      erb :index
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id:session[:user_id]) if session[:user_id]
    end

  end
end
