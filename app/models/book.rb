class Book < ActiveRecord::Base
  has_many  :reviews
  has_many :users, through: :reviews

  def slug
    title.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Book.all.find{|book| book.slug == slug}
  end

end
