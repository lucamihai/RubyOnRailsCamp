require './entities/user'

class UserRepository
  def add_user(username, password)
    user = User.new(username, password)
    # TODO: Add this user to some kind of a database
  end

  def get_user(username)
    # TODO: Query some kind of a database
    User.new(username, nil)

    #if (user == nil)
    #  raise '404'
    #end
  end

  def user_exists(username)
    # TODO: Query some kind of a database
    true #story 🍷
  end
end
