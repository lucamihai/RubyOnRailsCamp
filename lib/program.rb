require './lib/argumentsParser.rb'
require './lib/rubyGemsApi.rb'

class Program

  def self.execute
    rubyGemsApi = RubyGemsApi.new

    arguments = ArgumentsParser.parse
    gemsInfo = rubyGemsApi.getGemByName(arguments.searchTerm)
    displayGemInfo(gemsInfo)
  end

  def self.displayGemInfo(gemInfo)
    info = gemInfo.info.length > 100 ? "#{gemInfo.info[0, 100]}..." : gemInfo.info;

    puts "#{gemInfo.name}\n"
    puts "#{info}\n\n"
  end

  def self.displayGemsInfo(gemsInfo)
    puts "Found #{gemsInfo.count} gems"
    for gemInfo in gemsInfo
      displayGemInfo(gemInfo)
    end
  end

end
