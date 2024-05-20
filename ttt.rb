
module Game_Check
  def game_check
    winning_array = [[],[],[],[],[],[],[],[]]
    if @game_board.flatten.count("X") >= 3 || @game_board.flatten.count("O") >= 3
      if @game_board.any? { |element| element.all?("X")}
        puts "Congrats you won #{@player_1}"
      elsif @game_board.any? { |element| element.all?("O")}
        puts "Congrats you won #{@player_2}"
      elsif @game_board.all? { |element| element[0] }
        
      end
    end
  end

end


class Game

  include Game_Check
  @@games_played = 0
  @@player_1_wins = 0
  @@player_2_wins = 0
  @@player_1_icon = "X"
  @@player_2_icon = "O"
  attr_accessor :game_board_row_1, :game_board_row_2, :game_board_row_3
  attr_accessor :move, :starting_Player, :game_board
 

  def initialize(name1,name2)
    @game_board_row_1 = [1,2,3]
    @game_board_row_2 = [4,5,6]
    @game_board_row_3 = [7,8,9]
    @game_board = [@game_board_row_1, @game_board_row_2, @game_board_row_3]
    @player_1 = name1
    @player_2 = name2
    if rand(1..3) >= 2
      @starting_Player = name1

    else
      @starting_Player = name2
    end
    puts print @game_board_row_1
    puts print @game_board_row_2
    puts print @game_board_row_3
    puts "Your move #{self.starting_Player}!" 
    puts "Choose spot 1-9 on the board."
    @game_board.permutation(3) { |x| p x.permutation(3){ |x| p x}}
    game_move(gets.chomp,@starting_Player)
    
  end
  protected
  
  def game_move(number, player_name)
    @active_player = player_name
    if player_name == @player_1
      @inactive_player = @player_2
    else
      @inactive_player = @player_1
    end

    if player_name == @player_1 
      @player_icon = @@player_1_icon
    else
      @player_icon = @@player_2_icon
    end
    if number == "quit"
      puts "You have quit, run the program to play again"
    elsif @game_board.flatten(2).include?(number.to_i) != true && number.to_i.between?(1, 9)
      puts print self.game_board_row_1
      puts print self.game_board_row_2
      puts print self.game_board_row_3
      puts "Sorry that position is already played, try another one."
      game_move(gets.chomp, player_name)
    elsif @game_board.flatten(2).include?(number.to_i) != true
      puts print self.game_board_row_1
      puts print self.game_board_row_2
      puts print self.game_board_row_3
      puts "Thats not a valid answer try a number that matches a position on the board."
      game_move(gets.chomp, player_name)
    else
      @move_index = @game_board.index(number.to_i)
      @game_board.map { |element| element.map! { |element| element == number.to_i ? @player_icon : element}}
      puts print @game_board_row_1
      puts print @game_board_row_2
      puts print @game_board_row_3
      puts "Great move #{@active_player}, alright #{@inactive_player} its your turn." 
      game_move(gets.chomp, @inactive_player)
    end
    game_check() 
  end


end

class Players

end

puts "What is Player 1 name?"
first_Player = gets.chomp

puts "what is Player 2 name?"
second_Player = gets.chomp

Game.new(first_Player, second_Player)

