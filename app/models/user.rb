class User < ActiveRecord::Base
  has_many  :reviews
  has_many :books, through: :reviews

  has_secure_password

  def slug
    username.downcase.gsub(" ","-")

  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

  def self.find_by_email(email)
    User.all.find{|user| user.email == email}
  end

end
