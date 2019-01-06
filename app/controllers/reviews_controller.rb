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

  get '/reviews/:id/edit' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      if @review && @review.user == current_user
        erb :'reviews/edit'
      else
        #Eventually show error: "You can't edit a review written by another user"
        redirect to '/'
      end
    else
      redirect to '/'
    end
  end

  patch '/reviews/:id' do
    if logged_in?
      if params[:content] == ""
        # "You must write what you thought of the book"
        redirect to "/reviews/#{params[:id]}/edit"
      else
        @review = Review.find_by_id(params[:id])
        if @review && @review.user == current_user
          if @review.update(content: params[:content], stars: params[:stars])
            #"Review was successfully updated!"
            redirect to "/reviews/#{@review.id}"
          else
            #"Something went wrong. Review was not updated."
            redirect to "/reviews/#{@review.id}/edit"
          end
        else
          #"Something went wrong. Review was not updated."
          redirect to "/books"
        end
      end
    else
      redirect to '/'
    end
  end





end
