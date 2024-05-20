

class Game
  @@games_played = 0
  @@player_1_wins = 0
  @@player_2_wins = 0
  attr_accessor :game_board_row_1, :game_board_row_2, :game_board_row_3
  attr_accessor :move, :starting_Player, :game_board
  @game_board_row_1 = [1,2,3]
  @game_board_row_2 = [4,5,6]
  @game_board_row_3 = [7,8,9]

  def initialize(name1,name2)

    if rand(1..3) >= 2
      @starting_Player = name1
    else
      @starting_Player = name2
    end
    puts print self.game_board_row_1
    puts print self.game_board_row_2
    puts print self.game_board_row_3
    puts "Your move #{self.starting_Player}!" 
    puts "Choose spot 1-9 on the board."
    @move = gets.chomp
    game_move(@move)
  end

  protected
  @game_board = [@game_board_row_1, @game_board_row_2, @game_board_row_3].flatten(2)
  def game_move(number)
    
    if self.game_board.include?(number) != true && number.between?(1..9)
      puts print self.game_board_row_1
      puts print self.game_board_row_2
      puts print self.game_board_row_3
      puts "Sorry that position is already played, try another one."
      @move = gets.chomp
    elsif @game_board.include?(number) != true
      puts print self.game_board_row_1
      puts print self.game_board_row_2
      puts print self.game_board_row_3
      puts "Thats not a valid answer try a number that matches a position on the board."
      @move = gets.chomp
    else
      @game_board.each { |element| 
        element.each { |element| if element == number then element = self.player_piece else break end}}
      puts print self.game_board_row_1
      puts print self.game_board_row_2
      puts print self.game_board_row_3
      puts "Great move, alright #{} its your turn."
    end
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

