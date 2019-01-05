class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      "Sign up page says you're logged in"
    end
  end

  post '/signup' do
    if params[:username]=="" || params[:email]=="" || params[:password]==""
      #eventually show error - there can be no blank fields
      #but for now just reload page
      redirect to '/signup'
    else
      #if user account already exists with that email - user must sign up with a different email
      if User.find_by_email(params[:email])
        #eventually show an error message
        #"Account already exists under that email address. User another email or go to the log in page"
        redirect to '/signup'
      else
        @user = User.new(:username => params[:username], :email =>params[:email], :password =>params[:password])
        @user.save
        session[:user_id] = @user_id
        redirect to '/'
      end
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      "Logged in!"
    end
  end



end
