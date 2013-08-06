class PagesController < ApplicationController
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:success] = "Page saved!"
      redirect_to @page
    else
      flash.now[:error] = @page.errors.full_messages.first
      render :new
    end
  end
end
