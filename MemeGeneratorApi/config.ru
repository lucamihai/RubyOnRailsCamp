require './controllers/authorization_controller.rb'
require './controllers/meme_generator_controller.rb'

use AuthorizationController
run MemeGeneratorController
