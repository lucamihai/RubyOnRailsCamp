require './lib/my-gem.rb'
require 'faraday'
require 'faraday/net_http'
require 'json'
Faraday.default_adapter = :net_http

class RubyGemsApi
  def initialize
    @base_uri = "https://rubygems.org/api"
  end

  def gem_by_name(name)
    uri = "#{@base_uri}/v1/gems/#{name}"
    parsed_body = get_json_response(uri)

    gem = MyGem.new(parsed_body['name'], parsed_body['info'])
  end

  def search_gems(search_term, search_limit)
    uri = "#{@base_uri}/v1/search?query=#{search_term}"
    parsed_body = get_json_response(uri)

    limit = parsed_body.count > search_limit && search_limit > 0 ? search_limit : parsed_body.count
    gems = parsed_body.map{ |gem_body| MyGem.new(gem_body['name'], gem_body['info']) }
    gems[0..limit - 1]
  end

  private

  def get_json_response(uri)
    response = Faraday.get(uri)

    if response.status != 200
      puts "Error, got status #{response.status}"
      exit(false)
    end

    parsed_body = JSON.parse(response.body)
  end
end
