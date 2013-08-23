require 'websnap'
require 'smusher'
require 'sidekiq'

class ScreenshotsGenerator
  include Sidekiq::Worker

  def perform(url, generated_filename)
    kit = WebSnap::Snapper.new(url, :format => 'png')
    png = kit.to_bytes
    dir = Rails.root.join('public', 'screenshots')
    image_location = dir.to_s + "/#{generated_filename}"
    file = kit.to_file(image_location)
    Smusher.optimize_image(image_location)
  end
end