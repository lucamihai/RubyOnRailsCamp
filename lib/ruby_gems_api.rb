require './lib/my_gem.rb'
require './lib/http_service'
require 'faraday/net_http'
require 'json'
Faraday.default_adapter = :net_http

class RubyGemsApi
  def initialize
    @base_uri = "https://rubygems.org/api"
  end

  def gem_by_name(name)
    uri = "#{@base_uri}/v1/gems/#{name}"
    jsonGem = HttpService.get(uri)

    gem = MyGem.new(jsonGem['name'], jsonGem['info'])
  end

  def search_gems(search_term, search_limit)
    uri = "#{@base_uri}/v1/search?query=#{search_term}"
    jsonGems = HttpService.get(uri)

    limit = jsonGems.count > search_limit && search_limit > 0 ? search_limit : jsonGems.count
    gems = jsonGems.map{ |jsonGem| MyGem.new(jsonGem['name'], jsonGem['info']) }
    gems[0..limit - 1]
  end
end
