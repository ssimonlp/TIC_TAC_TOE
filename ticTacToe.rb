require_relative 'lib/Player' #on appelle chacun des fichiers qui contiennent nos différentes classes
require_relative 'lib/Game'
require_relative 'lib/Board'
require_relative 'lib/BoardCase'

require 'pastel'

$pastel = Pastel.new
Game.menu #on lance le menu du jeux
