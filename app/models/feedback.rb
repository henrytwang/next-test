class Feedback < ActiveRecord::Base
  attr_accessible :user_id, :page_id, :first_answer, :second_answer, :image
end
