require './lib/gemInfo.rb'
require 'faraday'
require 'faraday/net_http'
require 'json'
Faraday.default_adapter = :net_http

class RubyGemsApi
  def initialize
    @baseUri = "https://rubygems.org/api"
  end

  def getGemByName(name)
    uri = "#{@baseUri}/v1/gems/#{name}"
    response = Faraday.get(uri)

    if response.status != 200
      puts "Error, got status #{response.status}"
      exit(false)
    end

    parsedBody = JSON.parse(response.body)
    gemInfo = GemInfo.new
    gemInfo.name = parsedBody['name']
    gemInfo.info = parsedBody['info']

    gemInfo
  end

  def searchGems(searchTerm)
    uri = "#{@baseUri}/v1/search?query=#{searchTerm}"
    response = Faraday.get(uri)
    
    if response.status != 200
      puts "Error, got status #{response.status}"
      exit(false)
    end
    
    parsedBody = JSON.parse(response.body)

    gemsInfo = []
    for gem in parsedBody
      gemInfo = GemInfo.new
      gemInfo.name = gem['name']
      gemInfo.info = gem['info']
      gemsInfo.append(gemInfo)
    end

    gemsInfo
  end
end
