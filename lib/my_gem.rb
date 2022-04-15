require './lib/jsonable.rb'

class MyGem < JSONable
  
  def initialize(name, info)
    @name = name
    @info = info
  end

  attr_accessor :name
  attr_accessor :info
end