require 'json'
require './lib/arguments'
require './lib/caption'

module RequestBodyParser
  def self.extract_arguments(request_body_contents)
    request_payload = JSON.parse(request_body_contents)
    captions = extract_captions(request_payload)

    arguments = Arguments.new(
      request_payload['original_image_path'],
      request_payload['final_image_path'],
      captions)
  end

  private

  def self.extract_captions(request_payload)
    captions_payload = request_payload['captions']
    captions = []

    if (captions_payload == nil || !captions_payload.kind_of?(Array))
      return captions
    end

    for caption_payload in captions_payload
      caption = Caption.new(
        caption_payload['text'],
        caption_payload['font'] || 'Arial',
        caption_payload['fill_color'] || 'White',
        caption_payload['under_color'] || 'Black',
        caption_payload['point_size'] != nil ? caption_payload['point_size'].to_i : 8,
        caption_payload['position_x'] != nil ? caption_payload['position_x'].to_i : 0,
        caption_payload['position_y'] != nil ? caption_payload['position_y'].to_i : 0)

      captions.push(caption)
    end

    captions
  end
end
