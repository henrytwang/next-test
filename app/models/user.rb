class User < ActiveRecord::Base

  attr_accessible :username, :email, :password, :password_confirmation, :image

  has_secure_password

  has_many :votes
  has_many :comments
  has_many :pages

  validates :email, :uniqueness => { :case_sensitive => false }, :format => /\w+@\w+\.\w{2,4}/
  validates :username, :uniqueness  => { :case_sensitive => false }, :length => {:minimum => 4}
  validates :password, :length => {:minimum => 6}

  validates_confirmation_of :password

end
