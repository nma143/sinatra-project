class User < ActiveRecord::Base
  has_many  :reviews
  has_many :books, through: :reviews

  has_secure_password

  def self.find_by_email(email)
    User.all.find{|user| user.email == email}
  end


end
