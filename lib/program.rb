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
      info = gem.info.length > 100 ? "#{gem.info[0, 100]}..." : gem.info;

      puts "#{gem.name}\n"
      puts "#{info}\n\n"
    end
  end

end
