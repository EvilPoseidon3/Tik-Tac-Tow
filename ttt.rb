

class Game
  attr_accessor :game_board_row_1, :game_board_row_2, :game_board_row_3
  def initialize
    
    @game_board_row_1 = [1,2,3]
    @game_board_row_2 = [4,5,6]
    @game_board_row_3 = [7,8,9]
    puts print self.game_board_row_1
    puts print self.game_board_row_2
    puts print self.game_board_row_3
    puts "Your move player 1!" 
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

Game.new

