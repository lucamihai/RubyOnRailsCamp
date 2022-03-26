require "./lib/arguments.rb"

class ArgumentsParser
  def self.parse()
    arguments = Arguments.new
    arguments.search_term = get_search_term

    return arguments
  end

  def self.get_search_term()
    # something broke, so out of laziness I just do this
    return ARGV[1]
  end
end