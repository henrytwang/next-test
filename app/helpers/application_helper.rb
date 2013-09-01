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

  def screenshot_selection(current_screenshot)
    img = Magick::Image.read(current_screenshot)[0]
    chopped = img.crop(23, 81, 107, 139)
    chopped.write("1-new.png")
  end
end
