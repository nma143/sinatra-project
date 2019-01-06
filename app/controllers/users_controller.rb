class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/books'
    end
  end

  post '/signup' do
    if params[:username]=="" || params[:email]=="" || params[:password]==""
      flash[:error] = "No field can be blank"
      redirect to '/signup'
    else
      #don't accept invalid email addresss formats
      email_ok = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)\z/.match(params[:email])
      if !email_ok
        flash[:error] = "Invalid email format"
        redirect to '/signup'
      #if user account already exists with that email - user must sign up with a different email
      elsif User.find_by_email(params[:email])
        flash[:error] = "Account already exsits under that email address. Use another email or go to the log in page"
        redirect to '/signup'
      else
        @user = User.new(:username => params[:username], :email =>params[:email], :password =>params[:password])
        @user.save
        session[:user_id] = @user.id
        flash[:message]="New account created!"
        redirect to '/books'
      end
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/books'
    end
  end

  post '/login' do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/books'
    else
      flash[:error] = "Log in failed. If you have an account, try again. If not, go to the sign up page"
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
    end
    redirect to '/'
  end

  get '/users/:slug' do
    if !logged_in?
      redirect to '/'
    else
      @user = User.find_by_slug(params[:slug])
      if !@user || !(session[:user_id] == @user.id)
        flash[:error] = "You can't see another user's dashboard"
        redirect to '/'
      else
        erb :'users/show'
      end
    end
  end

end
