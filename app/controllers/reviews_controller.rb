class ReviewsController < ApplicationController

  get '/reviews/new' do
    if logged_in?
      @books= Book.all
      erb :'reviews/new'
    else
      redirect to '/'
    end
  end

  post '/reviews/new' do
    if !logged_in?
      redirect to '/'
    else
      if params[:content] == ""
        #eventually show an error: "You must write what you thought of the book"
        redirect to '/reviews/new'
      else
        @review = Review.new(:content => params[:content], :stars => params[:stars], :user_id => session[:user_id], :book_id => params[:book_id])
        @review.save
        redirect to "/books"
      end
    end
  end







end
