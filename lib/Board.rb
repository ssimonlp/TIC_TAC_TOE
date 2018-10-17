class Board
  attr_accessor :cases
  @@games_played = 0
  def initialize
    @@games_played += 1 #incrémentation du compteur de parties
    case1 = BoardCase.new([0, 0]) #création des nouvelles cases lors de l'initialisation
    case2 = BoardCase.new([0, 1])
    case3 = BoardCase.new([0, 2])
    case4 = BoardCase.new([1, 0])
    case5 = BoardCase.new([1, 1])
    case6 = BoardCase.new([1, 2])
    case7 = BoardCase.new([2, 0])
    case8 = BoardCase.new([2, 1])
    case9 = BoardCase.new([2, 2])
    @cases = [case1, case2, case3, case4, case5, case6, case7, case8, case9]
  end
  
  def print_board(active_player) #affichage du tableau 
    system "clear"
    puts "+---+---+---+
| #{cases[0].value} | #{cases[1].value} | #{cases[2].value} |
+---+---+---+
| #{cases[3].value} | #{cases[4].value} | #{cases[5].value} |
+---+---+---+
| #{cases[6].value} | #{cases[7].value} | #{cases[8].value} |
+---+---+---+
Games played : #{@@games_played} / It's #{active_player.odd? ? $player1.name : $player2.name}'s turn"  
  end
end
