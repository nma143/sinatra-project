class BooksController < ApplicationController

  get '/books' do
   if logged_in?
     @books = Book.all
     erb :'books/book_list'
   else
     redirect to '/'
   end
 end

end
