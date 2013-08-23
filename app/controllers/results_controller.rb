class ResultsController < ApplicationController
  def index
    @first_comments = Comment.find_all_by_question_id(1)
    @second_comments = Comment.find_all_by_question_id(2)
  end
end
