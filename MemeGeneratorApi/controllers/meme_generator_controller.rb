require 'json'
require 'sinatra'

class MemeGeneratorController < Sinatra::Base
  post '/memes' do
    request.body.rewind
    request_payload = JSON.parse(request.body.read)
    pp request_payload
    #[303, "Success"]
    redirect to('https://www.google.ro'), 303
  end
end
