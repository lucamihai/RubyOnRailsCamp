require './lib/my_gem.rb'
require './lib/http_service'
require './lib/cache_service'
require 'faraday/net_http'
require 'json'
Faraday.default_adapter = :net_http

class RubyGemsApi
  def initialize(http_service = HttpService.new, cache_service = CacheService.new)
    @base_uri = "https://rubygems.org/api"
    @http_service = http_service
    @cache_service = cache_service
  end

  def gem_by_name(name)
    gem_from_cache = @cache_service.get_cached_show_result(name, 48)

    if (gem_from_cache != nil)
      puts "got it from cache"
      return gem_from_cache
    end

    uri = "#{@base_uri}/v1/gems/#{name}"
    json_gem = @http_service.get(uri)
    puts ":( got 'em from ruby gems api"
    
    gem = MyGem.new(json_gem['name'], json_gem['info'])
    @cache_service.cache_show_result(name, gem)
    
    gem
  end

  def search_gems(search_term, search_limit)
    gems_from_cache = @cache_service.get_cached_search_result(search_term, 48)

    if (gems_from_cache != nil)
      puts "got 'em from cache"
      limit = gems_from_cache.count > search_limit && search_limit > 0 ? search_limit : gems_from_cache.count
      return gems_from_cache[0..limit - 1]
    end

    uri = "#{@base_uri}/v1/search?query=#{search_term}"
    json_gems = @http_service.get(uri)

    gems = json_gems.map{ |json_gem| MyGem.new(json_gem['name'], json_gem['info']) }
    @cache_service.cache_search_result(search_term, gems)
    puts ":( got 'em from ruby gems api"

    limit = gems.count > search_limit && search_limit > 0 ? search_limit : gems.count
    gems[0..limit - 1]
  end
end
