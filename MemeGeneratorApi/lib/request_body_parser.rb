require 'json'
require './lib/arguments'

module RequestBodyParser
  def self.extract_arguments(request_body_contents)
    request_payload = JSON.parse(request_body_contents)
    arguments = Arguments.new(
      request_payload['original_image_path'],
      request_payload['final_image_path'],
      request_payload['text'],
      request_payload['font'] || 'Arial',
      request_payload['fill_color'] || 'White',
      request_payload['under_color'] || 'Black',
      request_payload['point_size'] != nil ? request_payload['point_size'].to_i : 8,
      request_payload['gravity'] || 'Center')
  end
end
