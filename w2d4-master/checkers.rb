require_relative "player"
require_relative "piece"
require_relative "board"
require_relative "empty_square"

require "colorize"
require "io/console"

class CheckersGame

  attr_accessor :jumped
  attr_reader :piece, :players

  def initialize(players)
    @board = players.first.board
    @players = players
    jumped = nil
  end

  def self.run
    board = Board.populate_board
    player = Player.new(board, :white)
    player2 = Player.new(board, :black)
    checkers = CheckersGame.new([player, player2])
    checkers.play
  end

  def play
    until game_over
      play_turn
    end
    system("clear")
    puts "the game is over"
  end

  def play_turn
    puts "from the game, jumped is #{@jumped}"
    move = @players.first.get_move
    @board.perform_move(*move)
    jumped = @board.jumped
    while jumped == true
      play_extra_turns
    end
    @players.rotate!
  end

  def play_extra_turns
    move = @players.first.get_next_jump
    @board.perform_jump(*move)
  end

  def game_over
    false
  end

end

CheckersGame.run
