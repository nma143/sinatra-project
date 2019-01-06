class BooksController < ApplicationController

  get '/books' do
    if logged_in?
      @books = Book.all
      erb :'books/book_list'
    else
      redirect to '/'
    end
  end

  get '/books/:slug' do
    if logged_in?
      @book = Book.find_by_slug(params[:slug])
      star_ratings = @book.reviews.collect {|review| review.stars}
      @avg_star_rating = star_ratings.sum/star_ratings.size.to_f
      
      erb :'books/book_reviews'
    else
      redirect to '/'
    end
  end

end
