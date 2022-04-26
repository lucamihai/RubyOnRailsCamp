require 'json'
require 'sinatra'
require './lib/request_body_parser'

class MemeGeneratorController < Sinatra::Base
  post '/memes' do
    arguments = RequestBodyParser.extract_arguments(request.body.read)
    pp arguments
    redirect to('https://www.google.ro'), 303
  end
  
end
