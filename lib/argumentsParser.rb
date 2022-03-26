require "./lib/arguments.rb"

class ArgumentsParser
  def self.parse()
    arguments = Arguments.new
    arguments.searchTerm = getSearchTerm

    return arguments
  end

  def self.getSearchTerm()
    # something broke, so out of laziness I just do this
    return ARGV[1]
  end
end