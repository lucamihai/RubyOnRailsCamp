require './lib/gemInfo.rb'

class RubyGemsApi
  def initialize
    @baseUri = "https://rubygems.org/api"
  end

  def searchGems(searchTerm)
    arguments = ArgumentsParser.parse
    uri = "#{@baseUri}/v1/search?query=#{searchTerm}"
    puts uri
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

    return gemsInfo
  end
end
