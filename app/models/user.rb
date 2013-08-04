class User < ActiveRecord::Base

  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password

  validates :email, :uniqueness => { :case_sensitive => false }, :format => /\w+@\w+\.\w{2,4}/
  validates :username, :uniqueness  => { :case_sensitive => false }, :length => {:minimum => 4}
  validates :password, :length => {:minimum => 6}

  validates_confirmation_of :password

end
