class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.page_id = params[:page_id]
    @feedback.user_id = current_user.id if current_user
    @feedback.image = generated_filename
    screenshot_selection("#{Rails.root}/public/screenshots/#{Page.find(params[:page_id]).image}", @feedback.image, params[:x_coordinate].to_i, params[:y_coordinate].to_i, params[:width].to_i, params[:height].to_i)
    if @feedback.save
      redirect_to page_results_path(@feedback.page_id)
    else
      render :new
    end
  end
end
