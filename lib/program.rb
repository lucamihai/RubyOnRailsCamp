require './lib/argumentsParser.rb'
require './lib/rubyGemsApi.rb'

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
