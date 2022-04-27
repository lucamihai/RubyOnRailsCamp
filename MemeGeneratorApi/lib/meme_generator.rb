require 'mini_magick'
require './lib/arguments'

module MemeGenerator
  def self.generate_meme(arguments)
    if (arguments.original_image_path == nil || arguments.final_image_path == nil || arguments.text == nil)
      raise 'You need to provide at least original_image_path, final_image_path and text in order to generate some spicy memes'
    end

    image = MiniMagick::Image.open(arguments.original_image_path)
    image.combine_options do |c|
      c.gravity(arguments.gravity)
      c.stroke(arguments.under_color)
      c.strokewidth(1)
      c.fill(arguments.fill_color)
      c.pointsize arguments.point_size
      c.draw "text 0,300 '#{arguments.text}'" 
      c.font arguments.font
    end

    image.write(arguments.final_image_path)
    File.expand_path(arguments.final_image_path)
  end
end
