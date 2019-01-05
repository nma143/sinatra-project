class UsersController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      "Logged in!"
    end
  end



end
