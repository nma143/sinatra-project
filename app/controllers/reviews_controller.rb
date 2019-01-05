class ReviewsController < ApplicationController

  get '/reviews/new' do
    if logged_in?
      @books= Book.all
      erb :'reviews/new'
    else
      redirect to '/'
    end
  end
end
