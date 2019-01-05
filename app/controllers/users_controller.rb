class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      "Sign up page says you're logged in"
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
