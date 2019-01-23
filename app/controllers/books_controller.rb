class BooksController < ApplicationController

  get '/books' do
    if logged_in?
      @books = Book.all
      erb :'books/show'
    else
      redirect to '/'
    end
  end

  get '/books/:slug' do
    if logged_in?
      @book = Book.find_by_slug(params[:slug])
      if @book
        star_ratings = @book.reviews.collect {|review| review.stars}
        @avg_star_rating = (star_ratings.sum/star_ratings.size.to_f).round(1)
      else
        flash[:error] = "That book could not be found"
        redirect to '/'
      end

      erb :'books/book_reviews'
    else
      redirect to '/'
    end
  end

end
