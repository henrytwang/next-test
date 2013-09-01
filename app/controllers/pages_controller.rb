class PagesController < ApplicationController
  respond_to :html, :js

  def new
    @page = Page.new()
  end

  def create
    @page = Page.new(params[:page])
    generated_filename = Array.new(40){[*'0'..'9', *'a'..'z'].sample}.join + '.png'
    @page.image = generated_filename
    @page.user_id = current_user.id if current_user
    ScreenshotsGenerator.perform_async(params[:page][:url], generated_filename)

    if @page.save
      respond_with @page, :location => root_path
    else
      render :new
    end
  end


  def show
    @page = Page.find(params[:id])
    @page_url = @page.url.sub(/^https?\:\/\//, '').sub(/^www./,'')
  end
end
