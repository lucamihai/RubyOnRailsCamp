require 'optparse'
require 'faraday'
require 'faraday/net_http'
require 'json'
require './lib/argumentsParser.rb'
require './lib/rubyGemsApi.rb'
Faraday.default_adapter = :net_http

class Program

  def self.execute
    rubyGemsApi = RubyGemsApi.new

    arguments = ArgumentsParser.parse
    gemsInfo = rubyGemsApi.searchGems(arguments.searchTerm)
    displayGemsInfo(gemsInfo)
  end

  def self.displayGemsInfo(gemsInfo)
    puts "Found #{gemsInfo.count} gems"
    for gem in gemsInfo
        puts "#{gem.name}\n"
        puts "#{gem.info}\n\n"
    end
  end

end
