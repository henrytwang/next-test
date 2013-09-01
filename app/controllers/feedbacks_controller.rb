class FeedbacksController < ApplicationController
  def create
    p params
    redirect_to :back
  end
end
