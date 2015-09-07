require_relative 'board.rb'

class Player
  attr_reader :board, :turn_pos, :flag_reveal

  def initialize
    @board = Board.new(9,5)
  end

  def play
    until game_over?
      play_turn
    end
  end

  def play_turn
    @board.render
    prompt
    if flag_reveal == "f"
      !@board.grid[turn_pos].flagged
    else
      if @board.grid[turn_pos].bomb == true
        game_over?
      elsif @board.grid[turn_pos].bomb == false
        @board.grid[turn_pos].hidden = false
        if @board.grid[turn_pos].neighbor_bomb_count == 0
          @board.grid[turn_pos].uncover_adjacents
        end
      end
    end

  end



  def prompt
    puts "pick a position (#, #)"
    turn_pos = gets.chomp
    puts "flag/unflag or reveal? (f/r)"
    flag_reveal = gets.chomp.downcase
  end

  def game_over?
    @board.grid.each do |row|
      row.each do |el|
        if el.bomb && !el.hidden
          puts "The game is over! You hit a bomb."
          return true
        elsif (el.bomb && el.flagged) || !el.hidden
          puts "The game is over! You won!"
          return true
        end
      end
    end
    false
  end

end

p = Player.new
p.play
