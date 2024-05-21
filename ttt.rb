module GameCheck
  attr_accessor :winning_player, :x, :first_Player, :second_Player

  def game_check(nested_array)
    @winning_player = String.new
    print @winning_player
    game_check_1(nested_array)
    game_check_2
  end

  def game_check_1(nested_array)
    # case nested_array
    if nested_array.any? { |array| array.all?('X') }
      self.winning_player = @player_1
    elsif nested_array.any? { |array| array.all?('O') }
      self.winning_player = @player_2
    elsif nested_array.all? { |array| array[0] == 'X' }
      self.winning_player = @player_1
    elsif nested_array.all? { |array| array[1] == 'X' }
      self.winning_player = @player_1
    elsif nested_array.all? { |array| array[2] == 'X' }
      self.winning_player = @player_1
    elsif nested_array.all? { |array| array[0] == 'O' }
      self.winning_player = @player_2
    elsif nested_array.all? { |array| array[1] == 'O' }
      self.winning_player = @player_2
    elsif nested_array.all? { |array| array[2] == 'O' }
      self.winning_player = @player_2
    elsif nested_array[2][0] == 'X' && nested_array[1][1] == 'X' && nested_array[0][2] == 'X'
      self.winning_player = @player_1
    elsif nested_array[0][0] == 'X' && nested_array[1][1] == 'X' && nested_array[2][2] == 'X'
      self.winning_player = @player_1
    elsif nested_array[2][0] == 'O' && nested_array[1][1] == 'O' && nested_array[0][2] == 'O'
      self.winning_player = @player_2
    elsif nested_array[0][0] == 'O' && nested_array[1][1] == 'O' && nested_array[2][2] == 'O'
      self.winning_player = @player_2
    end
  end

  def game_check_2
    return unless @winning_player.to_s.length > 0

    puts print @game_board_row_1
    puts print @game_board_row_2
    puts print @game_board_row_3
    puts "Congradulation #{@winning_player} you Won!"
    puts 'Would you like to play again? (yes/no)'
    @x = gets.chomp
    if @x.downcase == 'yes'
      puts 'What is Player 1 name?'
      @first_Player = gets.chomp

      puts 'what is Player 2 name?'
      @second_Player = gets.chomp
      Game.new(@first_Player, @second_Player)
    else
      puts ' GAME OVER'
    end
  end
end

class Game
  @@games_played = 0
  @@player_1_wins = 0
  @@player_2_wins = 0
  @@player_1_icon = 'X'
  @@player_2_icon = 'O'
  attr_accessor :game_board_row_1, :game_board_row_2, :game_board_row_3, :move, :starting_Player, :game_board,
                :player_1, :player_2

  def initialize(name1, name2)
    @game_board_row_1 = [1, 2, 3]
    @game_board_row_2 = [4, 5, 6]
    @game_board_row_3 = [7, 8, 9]
    @game_board = [@game_board_row_1, @game_board_row_2, @game_board_row_3]
    @player_1 = name1
    @player_2 = name2
    @starting_Player = if rand(1..3) >= 2
                         name1

                       else
                         name2
                       end
    puts print @game_board_row_1
    puts print @game_board_row_2
    puts print @game_board_row_3
    puts "Your move #{starting_Player}!"
    puts 'Choose spot 1-9 on the board.'
    game_move(gets.chomp, @starting_Player)
  end

  protected

  include GameCheck
  def game_move(number, player_name)
    @active_player = player_name
    @inactive_player = if player_name == @player_1
                         @player_2
                       else
                         @player_1
                       end

    @player_icon = if player_name == @player_1
                     @@player_1_icon
                   else
                     @@player_2_icon
                   end
    if number == 'quit'
      puts 'You have quit, run the program to play again'
    elsif game_board.flatten(2).any? { |element| element.class == Integer } == false
      puts 'Game over no winners.'
      puts 'Would you like to play again? (yes/no)'
      @x = gets.chomp
      if @x.downcase == 'yes'
        puts 'What is Player 1 name?'
        @first_Player = gets.chomp

        puts 'what is Player 2 name?'
        @second_Player = gets.chomp
        Game.new(@first_Player, @second_Player)
      end
    elsif game_board.flatten(2).include?(number.to_i) != true && number.to_i.between?(1, 9)
      puts print game_board_row_1
      puts print game_board_row_2
      puts print game_board_row_3
      puts 'Sorry that position is already played, try another one.'
      game_move(gets.chomp, player_name)
    elsif game_board.flatten(2).include?(number.to_i) != true
      puts print game_board_row_1
      puts print game_board_row_2
      puts print game_board_row_3
      puts 'Thats not a valid answer try a number that matches a position on the board.'
      game_move(gets.chomp, player_name)
    else
      @move_index = @game_board.index(number.to_i)
      game_board.map { |element| element.map! { |element| element == number.to_i ? @player_icon : element } }
      game_check(@game_board)
      puts print @game_board_row_1
      puts print @game_board_row_2
      puts print @game_board_row_3
      puts "Great move #{@active_player}, alright #{@inactive_player} its your turn."
      game_move(gets.chomp, @inactive_player)
    end
  end
end

class Players
end

puts 'What is Player 1 name?'
first_Player = gets.chomp

puts 'what is Player 2 name?'
second_Player = gets.chomp

firstgame = Game.new(first_Player, second_Player)
