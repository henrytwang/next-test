class PagesController < ApplicationController
  def create
    @page = Page.new(params[:page])

    # imgkit to import screenshot

    # kit = IMGKit.new(params[:page][:url])
    # img = kit.to_img(:jpg)
    # dir = Rails.root.join('public', 'screenshots')
    # generated_filename = Array.new(40){[*'0'..'9', *'a'..'z'].sample}.join + '.jpg'
    # image_location = dir.to_s + "/#{generated_filename}"
    # file = kit.to_file(image_location)

    # websnap to import screenshot

    kit = WebSnap::Snapper.new(params[:page][:url], :format => 'png')
    png = kit.to_bytes
    dir = Rails.root.join('public', 'screenshots')
    generated_filename = Array.new(40){[*'0'..'9', *'a'..'z'].sample}.join + '.png'
    image_location = dir.to_s + "/#{generated_filename}"
    file = kit.to_file(image_location)
    Smusher.optimize_image(image_location)

    @page.image = generated_filename
    @page.user_id = current_user.id if current_user

    if @page.save
      flash[:success] = "#{@page.id}"
      session[:current_page_image] = @page.id
      session[:current_page_url] = @page.url
      redirect_to :back
    else
      flash.now[:error] = @page.errors.full_messages.first
      render :new
    end
  end

  def show
    @page = Page.find(params[:id])
  end
end
