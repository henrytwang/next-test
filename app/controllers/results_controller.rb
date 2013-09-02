class ResultsController < ApplicationController
  def index
    @feedback_collection = Feedback.find_all_by_page_id(params[:page_id])
  end
end
