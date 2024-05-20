

class Game
  @@games_played = 0
  @@player_1_wins = 0
  @@player_2_wins = 0
  @rnd_number = rand 1..3
  attr_accessor :game_board_row_1, :game_board_row_2, :game_board_row_3
  attr_accessor :rnd_number, :starting_Player
  

  if (rnd_number >= 2)
    @starting_Player = name1
  else
    @starting_Player = name2
  end

  def initialize(name1,name2)
    
    @game_board_row_1 = [1,2,3]
    @game_board_row_2 = [4,5,6]
    @game_board_row_3 = [7,8,9]
    puts print self.game_board_row_1
    puts print self.game_board_row_2
    puts print self.game_board_row_3
    puts "Your move #{self.starting_Player}!" 
    puts "Choose spot 1-9 on the board."
    move = gets.chomp
  end

  protected

  def game_move(number)
    
  end

  def game_move_action
    move = game_board[move]
  end
end

class Players

end
puts "What is Player 1 name?"
first_Player = gets.chomp

puts "what is Player 2 name?"
second_Player = gets.chomp
Game.new(first_Player, second_Player)

