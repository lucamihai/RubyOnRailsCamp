require "./lib/arguments.rb"

module ArgumentsParser
  def self.parse(args)
    arguments = Arguments.new
    arguments.name = get_name(args)
    arguments.search_term = get_search_term(args)
    arguments.search_limit = get_search_limit(args)

    return arguments
  end

  private

  # TODO: use something more reliable than just assuming each argument's position
  def self.get_name(args)
    if args[0] == 'show'
      return args[1]
    else
      return ''
    end
  end

  # TODO: use something more reliable than just assuming each argument's position
  def self.get_search_term(args)
    if args[0] == 'search'
      return args[1]
    else
      return ''
    end
  end

  # TODO: use something more reliable than just assuming each argument's position
  def self.get_search_limit(args)
    if (args[2] == '--limit')
      return args[3].to_i
    else
      return 0
    end
  end

end
