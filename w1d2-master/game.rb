require_relative 'board.rb'
require 'byebug'

class Game
  def initialize
    @board = Board.new
  end

  def run
    until @board.over?
      moves = prompt
      @board.drop_disc(moves.first, :red)
      @board.drop_disc(moves.last, :yellow)
      @board.render
    end
  end

  def prompt
    puts "Player 1's move"
    player1_move = gets.chomp.to_i
    puts "Player 2's move"
    player2_move = gets.chomp.to_i
    moves =[player1_move, player2_move]
  end

end

Game.new.run
