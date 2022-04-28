require 'mini_magick'
require "open-uri"
require './lib/arguments'

module MemeGenerator
  def self.generate_meme(arguments)
    if (arguments.original_image_path == nil || arguments.final_image_path == nil || arguments.text == nil)
      raise 'You need to provide at least original_image_path, final_image_path and text in order to generate some spicy memes'
    end

    original_image_path = arguments.original_image_path
    temp_image_path = nil

    if (is_url(arguments.original_image_path))
      temp_image_path = Time.now.to_i.to_s
      URI.open(arguments.original_image_path.chomp) do |image|
        File.open(temp_image_path, "wb") do |file|
          file.write(image.read)
        end
      end
    end

    image = MiniMagick::Image.open(original_image_path)
    image.combine_options do |c|
      c.gravity(arguments.gravity)
      c.stroke(arguments.under_color)
      c.strokewidth(1)
      c.fill(arguments.fill_color)
      c.pointsize arguments.point_size
      c.draw "text 0,300 '#{arguments.text}'" 
      c.font arguments.font
    end

    if (temp_image_path != nil)
      File.delete(temp_image_path)
    end

    image.write(arguments.final_image_path)
    File.expand_path(arguments.final_image_path)
  end

  private

  def self.is_url(path)
    path.include?('http')
  end
end
