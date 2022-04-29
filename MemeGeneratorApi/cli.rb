require './lib/user_repository'

# Ignore this, just debugging non-sense
user_repository = UserRepository.new
pp user_repository.user_exists('mihai')
pp user_repository.user_exists('mihai2')