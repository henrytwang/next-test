class Page < ActiveRecord::Base
  attr_accessible :image, :url

  belongs_to :user
end
