load 'board.rb'
load 'humanplayer.rb'
load 'aiplayer.rb'


class Game
  attr_reader :gameboard

  def initialize(difficulty, player)
    @turns = (difficulty - 1)**2 + 3
    @gameboard = Board.new(difficulty)
    @player = player
    puts "You are a human player" if @player.is_a?(HumanPlayer)
    puts "Computer player" if @player.is_a?(AIPlayer)
  end

  def run

    while !@gameboard.won?
      puts "You have #{@turns} turns left"

      input1 = get_user_input
      input1.reveal
      gameboard.render

      input2 = get_user_input
      input2.reveal
      gameboard.render

      check_matching(input1, input2)
      puts nil
      gameboard.render
      @turns -= 1
      return lose if @turns == 0
    end
    puts "You win!"
  end

  def get_user_input
    pos = @player.choose_position
#    @player.feedback([pos[0]-1],[pos[1]-1])
    @gameboard.board[pos[0]-1][pos[1]-1]
  end

  def lose
    puts "You lose!"
  end

  def check_matching(input1, input2)
    if input1 == input2
      #do nothing
    else
      input1.hide
      input2.hide
    end
  end
end

if __FILE__ == $PROGRAM_NAME

  puts "Enter your difficulty (easy, medium, or hard)"
  lvl = gets.chomp.downcase
  while true
      if lvl == "easy" || lvl == "e"
        difficulty = 2
        break
      elsif lvl == "medium" || lvl == "m"
        difficulty = 4
        break
      elsif lvl == "hard" || lvl == "h"
        difficulty = 6
        break
      else
        puts "Invalid entry, re-enter."
        lvl = gets.chomp.downcase
      end
  end

  puts "Want to see a AI play? Y/N"
  choice = gets.chomp.downcase
  if choice == "y"
    player = AIPlayer.new(difficulty)
  else
    player = HumanPlayer.new
  end

  g = Game.new(difficulty, player)
  g.run
end
