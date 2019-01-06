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

  get '/reviews/:id' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      erb :'reviews/show_review'
    else
      redirect to '/'
    end
  end

  post '/reviews/:id/delete' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      if @review && @review.user == current_user
        @review.delete
        #eventually show message: "Review was successfully deleted!"
      end
      redirect to "/books"
    else
      redirect to '/'
    end
  end




end
