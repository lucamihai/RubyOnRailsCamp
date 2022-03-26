require "./lib/arguments.rb"

class ArgumentsParser
  def self.parse()
    arguments = Arguments.new
    arguments.name = get_name
    arguments.search_term = get_search_term

    return arguments
  end

  def self.get_name()
    if ARGV[0] == 'show'
      return ARGV[1]
    else
      return ''
    end
  end

  def self.get_search_term()
    if ARGV[0] == 'search'
      return ARGV[1]
    else
      return ''
    end
  end
end
