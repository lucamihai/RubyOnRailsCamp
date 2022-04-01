require './lib/arguments_parser.rb'
require './lib/ruby_gems_api.rb'

class Program

  def self.execute
    ruby_gems_api = RubyGemsApi.new

    arguments = ArgumentsParser.parse(ARGV)

    if (arguments.name != '')
      gem_info = ruby_gems_api.gem_by_name(arguments.name)
      display_gem_info(gem_info)
    elsif (arguments.search_term != '')
      gems_info = ruby_gems_api.search_gems(arguments.search_term, arguments.search_limit)
      display_gems_info(gems_info)
    end
  end

  private

  def self.display_gem_info(gem_info)
    info = gem_info.info.length > 100 ? "#{gem_info.info[0, 100]}..." : gem_info.info;

    puts "#{gem_info.name}\n"
    puts "#{info}\n\n"
  end

  def self.display_gems_info(gems_info)
    puts "Found #{gems_info.count} gems"
    for gem_info in gems_info
      display_gem_info(gem_info)
    end
  end

end
