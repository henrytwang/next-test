class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :page_id, :question_id

  belongs_to :user
  belongs_to :page
  has_many :votes
end
