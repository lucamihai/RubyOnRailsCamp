require "./lib/arguments.rb"

class ArgumentsParser
  def self.parse()
    arguments = Arguments.new
    arguments.name = get_name
    arguments.search_term = get_search_term
    arguments.search_limit = get_search_limit

    return arguments
  end

  # TODO: use something more reliable than just assuming each argument's position
  def self.get_name()
    if ARGV[0] == 'show'
      return ARGV[1]
    else
      return ''
    end
  end

  # TODO: use something more reliable than just assuming each argument's position
  def self.get_search_term()
    if ARGV[0] == 'search'
      return ARGV[1]
    else
      return ''
    end
  end

  # TODO: use something more reliable than just assuming each argument's position
  def self.get_search_limit()
    if (ARGV[2] == '--limit')
      return ARGV[3].to_i
    else
      return 0
    end
  end

end
