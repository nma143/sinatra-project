class ReviewsController < ApplicationController

  get '/reviews/new' do
    if logged_in?
      #A user can't review the same book twice.
      #In the dropdown book selector, only show books they have not reviewed
      @books_to_review = Book.all - current_user.books
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
        flash[:error] = "You must write what you thought of the book"
        redirect to '/reviews/new'
      else
        @review = Review.new(:content => params[:content], :stars => params[:stars], :user_id => session[:user_id], :book_id => params[:book_id])
        @review.save
        flash[:message] = "Review successfully created"
        redirect to "/users/#{current_user.slug}"
      end
    end
  end

  get '/reviews/:id' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      if @review
        erb :'reviews/show_review'
      else
        flash[:error] = "That review could not be found"
        redirect to '/'
      end
    else
      redirect to '/'
    end
  end

  post '/reviews/:id/delete' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      if @review && @review.user == current_user
        @review.delete
        flash[:message] = "Review was successfully deleted!"
      end
      redirect to "/users/#{current_user.slug}"
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
        flash[:error] = "You can't edit a review written by another user"
        redirect to '/'
      end
    else
      redirect to '/'
    end
  end

  patch '/reviews/:id' do
    if logged_in?
      if params[:content] == ""
        flash[:error] = "You must write what you thought of the book"
        redirect to "/reviews/#{params[:id]}/edit"
      else
        @review = Review.find_by_id(params[:id])
        if @review && @review.user == current_user
          if @review.update(content: params[:content], stars: params[:stars])
            flash[:message] = "Review was successfully updated!"
            redirect to "/reviews/#{@review.id}"
          else
            flash[:error] = "Something went wrong. Review was not updated."
            redirect to "/reviews/#{@review.id}/edit"
          end
        else
          flash[:error] = "Something went wrong. Review was not updated."
          redirect to "/users/#{current_user.slug}"
        end
      end
    else
      redirect to '/'
    end
  end

end
