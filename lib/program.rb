require 'optparse'
require 'faraday'
require 'faraday/net_http'
require 'json'
require 'pp'
Faraday.default_adapter = :net_http

class Program

    def self.execute
        searchParam = getSearchParam
        uri = "https://rubygems.org/api/v1/search?query=#{searchParam}"
        puts uri
        response = Faraday.get(uri)
        
        if response.status != 200
            puts "Error, got status #{response.status}"
            exit(false)
        end
        
        parsedBody = JSON.parse(response.body)
        
        puts "Found #{parsedBody.count} gems"
        for gem in parsedBody
            puts "#{gem["name"]}\n"
        end
    end

    def self.getSearchParam()
        # something broke, so out of laziness I just do this
        return ARGV[1]
    end
end