require_relative "empty_square"
require "byebug"
class Piece

  attr_accessor :pos
  attr_reader :board, :color, :grid

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @board.add_piece(pos, self)
  end

  def valid_moves
    slide_moves + jump_moves
  end

  def slide_moves
    direction = @color == :black ? 1 : -1
    slides_arr = [[direction * 1, 1], [direction * 1, -1]]
    slides_arr = get_moves_from_array(slides_arr)
    slides_arr = slides_arr.select { |move| valid_slide?(move) }
    slides_arr
  end

  def jump_moves
    direction = @color == :black ? 1 : -1
    jumps_arr = [[direction * 2, 2], [direction * 2, -2]]
    jumps_arr = get_moves_from_array(jumps_arr)
    jumps_arr = jumps_arr.select { |move| valid_jump?(move) }
  end

  def valid_slide?(move)
    !@board.occupied?(move)
  end

  def valid_jump?(move)
    @board.occupied_by_color?(pos_between(move, @pos), other_color) &&
    !@board.occupied?(move)
  end

  def get_moves_from_array(array)
    arr = array.map { |delta| add(delta, @pos) }
    arr.select { |pos| @board.in_bounds?(pos) }
  end

  def move_piece(new_pos)
    @pos = new_pos
  end

  def add(pos1, pos2)
    [pos1[0] + pos2[0], pos1[1] + pos2[1]]
  end

  def pos_between(pos1, pos2)
    [(pos1[0] + pos2[0])/2, (pos1[1] + pos2[1])/2]
  end

  def other_color
    @color == :white ? :black : :white
  end

  def colorize_piece(str)
    str.colorize(color)
  end

  def to_s
    colorize_piece(" ♛ ")
  end

  def empty?
    false
  end

end
