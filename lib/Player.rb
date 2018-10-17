class Player
  attr_accessor :moves, :wins
  attr_reader :name
  def initialize(name) #chacun des joueurs a comme attributs son nom, ses victoires et l'ensemble de ses mouvements
    @name = name
    @wins = 0
    @moves = []
  end
end
