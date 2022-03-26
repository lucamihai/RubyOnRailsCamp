require 'optparse'
require 'faraday'
require 'faraday/net_http'
require 'json'
require './lib/argumentsParser.rb'
Faraday.default_adapter = :net_http

class Program

  def self.execute
    arguments = ArgumentsParser.parse
    uri = "https://rubygems.org/api/v1/search?query=#{arguments.searchParam}"
    response = Faraday.get(uri)
    
    if response.status != 200
        puts "Error, got status #{response.status}"
        exit(false)
    end
    
    parsedBody = JSON.parse(response.body)
    displayParsedBody(parsedBody)
    
  end

  def self.displayParsedBody(parsedBody)
    puts "Found #{parsedBody.count} gems"
    for gem in parsedBody
        puts "#{gem["name"]}\n"
    end
  end

end
