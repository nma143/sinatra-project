class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      "Sign up page says you're logged in"
    end
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :email =>params[:email], :password =>params[:password])
    @user.save
    session[:user_id] = @user_id
    redirect to '/'
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      "Logged in!"
    end
  end



end
