require 'optparse'
require 'faraday'
require 'faraday/net_http'
require 'json'
require 'pp'
Faraday.default_adapter = :net_http

def getSearchParam()
    OptionParser.new do |parser|
        parser.on("search", "--require searchParam",
            "Require the searchParam before executing your script") do |searchParam|
                puts "You required #{searchParam}"
                return searchParam
            end
    end.parse!
end


searchParam = getSearchParam
uri = "https://rubygems.org/api/v1/search?query=name:+#{searchParam}++description:+#{searchParam}"
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

for arg in ARGV
    puts arg
end

