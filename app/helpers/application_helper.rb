module ApplicationHelper

  def current_user
    @_current_user ||= session[:current_user_id] &&
                       User.find_by_id(session[:current_user_id])
  end

  def flash_class(level)
    {:notice  => "alert alert-info",
     :success => "alert alert-success",
     :error   => "alert alert-error",
     :alert   => "alert alert-error"}[level]
  end

  def generated_filename
    Array.new(40){[*'0'..'9', *'a'..'z'].sample}.join + '.png'
  end

  def screenshot_selection(current_screenshot, file_name, x_coordinate, y_coordinate, width, height)
    img = Magick::Image.read(current_screenshot)[0]
    chopped = img.crop(x_coordinate, y_coordinate, width, height)
    chopped.write("#{Rails.root}/public/screenshots/crops/#{file_name}")
  end
end
