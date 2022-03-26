require './lib/gemInfo.rb'
require 'faraday'
require 'faraday/net_http'
require 'json'
Faraday.default_adapter = :net_http

class RubyGemsApi
  def initialize
    @base_uri = "https://rubygems.org/api"
  end

  def get_gem_by_name(name)
    uri = "#{@base_uri}/v1/gems/#{name}"
    response = Faraday.get(uri)

    if response.status != 200
      puts "Error, got status #{response.status}"
      exit(false)
    end

    parsed_body = JSON.parse(response.body)
    gem_info = GemInfo.new
    gem_info.name = parsed_body['name']
    gem_info.info = parsed_body['info']

    gem_info
  end

  def search_gems(search_term)
    uri = "#{@base_uri}/v1/search?query=#{search_term}"
    response = Faraday.get(uri)
    
    if response.status != 200
      puts "Error, got status #{response.status}"
      exit(false)
    end
    
    parsed_body = JSON.parse(response.body)

    gems_info = []
    for gem in parsed_body
      gem_info = GemInfo.new
      gem_info.name = gem['name']
      gem_info.info = gem['info']
      gems_info.append(gem_info)
    end

    gems_info
  end
end
