class Game
  attr_reader :player_turn
  def self.new_game
    $player1.moves = [] #chacun des joueurs a un array contenant ses mouvements
    $player2.moves = []
    @@player_turn = 0 #compteur de tours pour savoir qui doit jouer le prochain
    @board = Board.new
    @board.print_board(@@player_turn)
    self.move
  end
  
  def self.menu #au début de chaque partie on rentre les noms des joueurs 
    system "clear"
    puts "1) New game
2) Exit"
    choice = gets.chomp.to_i
    case choice
    when 1
      print "Name player 1 : "
      $player1 = Player.new(gets.chomp)
      print "Name player 2 : "
      $player2 = Player.new(gets.chomp)
      self.new_game
    else
      return
    end
  end
  
  def self.move #fonction qui gère les déplacements des joueurs 
    print "Choose a case to fill between 1 and 9 : "
    n = gets.chomp.to_i
    if  (1..9).include?(n)     #gestion des erreurs (pas de chiffres sup à 9)
      if  @board.cases[n-1].value == " "      
        if @@player_turn.even?
          @board.cases[n-1].value = $pastel.red("X") #pastel correspond à la gem qui donne la couleur 
          $player1.moves << @board.cases[n-1].pos
        else
          @board.cases[n-1].value = $pastel.green("O")
          $player2.moves << @board.cases[n-1].pos
        end     
      else
        puts "Choisissez une autre case"
        self.move
      end
    else
      puts "Entre 1 et 9 svp"
      self.move
    end
    @board.print_board(@@player_turn) #à la fin des boucles on affiche le tableau
    if self.victory(@@player_turn)# on vérifie si on a détecté ue victoire
      puts "Would you like to play again ? (y/n)"
      if gets.chomp == "y"
        self.new_game
      else
        puts "Goodbye :'("
        system "clear"
      end
      return
    end
    @@player_turn += 1
    self.move
  end
  
  def self.victory(player) #fonctions qui vérifie nos 4 conditions de victoire
    moves = player.even? ? $player1.moves : $player2.moves
    array_x = []
    array_y = []
    moves.each do |m|
      array_x << m[0]
      array_y << m[1]
    end
    count1 = 0
    count2 = 0
    
    for i in 0..array_x.length-1
      if array_x[i] == array_y[i] 
        count1 += 1
      end
    end
    
    for j in 0..array_x.length-1 
      if (-1*array_x[j]+2) == array_y[j]
        count2 += 1
      end
    end
    
    if array_x.count(0) == 3 || array_x.count(1) == 3 || array_x.count(2) == 3 #condition pour une victoire sur une ligne horizontale
      player.even? ? $player1.wins += 1 : $player2.wins +=1
      puts "Player #{player.even? ? $player1.name : $player2.name} win on X!"
      return true
    elsif  array_y.count(0) == 3 || array_y.count(1) == 3 || array_y.count(2) == 3#condition pour une victoire verticale
      player.even? ? $player1.wins += 1 : $player2.wins +=1
      puts "Player #{player.even? ? $player1.name : $player2.name} win on Y!"
      return true
    elsif count1 == 3 || count2 == 3 #condition pour les deux diagonales
      player.even? ? $player1.wins += 1 : $player2.wins +=1
      puts "Player #{player.even? ? $player1.name : $player2.name} win on diag"
      return true
    elsif ($player1.moves.length + $player2.moves.length) == 9
      puts "Match nul !"
      return true
    end
  end
end
