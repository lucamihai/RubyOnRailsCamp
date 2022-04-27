require 'json'
require 'sinatra'
require './lib/request_body_parser'
require './lib/meme_generator'

class MemeGeneratorController < Sinatra::Base
  post '/memes' do
    arguments = RequestBodyParser.extract_arguments(request.body.read)
    meme_absolute_file_path = MemeGenerator.generate_meme(arguments)
    #redirect to("file:///#{meme_absolute_file_path}"), 303
    send_file("#{meme_absolute_file_path}")
  end
  
end
