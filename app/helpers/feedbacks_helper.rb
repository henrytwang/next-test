require 'RMagick' 

module FeedbacksHelper
  def screenshot_selection(image_name)
    img = Magick::Image.read(image_name)[0]
    chopped = img.crop(23, 81, 107, 139)
    chopped.write("1-new.png")
  end
end
