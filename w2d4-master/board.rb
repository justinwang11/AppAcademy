require_relative "empty_square"

class Board

  attr_reader :pos, :players, :jumped

  EMPTY_SQUARE = EmptySquare.new

  def initialize
    @grid = Array.new(8) do
      Array.new(8) { EMPTY_SQUARE }
    end
    @moves = []
  end

  def self.populate_board
    board = Board.new
    populate_black_pieces(board)
    populate_white_pieces(board)
    board
  end

  def self.populate_black_pieces(board)
    4.times { |col| Piece.new(:black, board, [0, col * 2 + 1]) }
    4.times { |col| Piece.new(:black, board, [1, col * 2]) }
    4.times { |col| Piece.new(:black, board, [2, col * 2 + 1]) }
  end

  def self.populate_white_pieces(board)
    4.times { |col| Piece.new(:white, board, [5, col * 2]) }
    4.times { |col| Piece.new(:white, board, [6, col * 2 + 1])}
    4.times { |col| Piece.new(:white, board, [7, col * 2])}
  end

  def render(clicked, cursor, player_color)
    possible_moves = get_yellow_squares(clicked, cursor, player_color)
    @grid.each_with_index do |row, i|
      row.each_with_index do |square, j|
        if cursor == [i, j]
          color = :red
        elsif possible_moves.include?([i, j])
          color = :yellow
        else
          color = (i + j) % 2 == 0 ? :blue : :magenta
        end
        print square.to_s.colorize(:background => color)
      end
      puts
    end
    puts "from the board, jumped is #{@jumped}"
  end

  def get_yellow_squares(clicked, cursor, color)
    current_square = clicked.nil? ? piece_at(cursor) : piece_at(clicked)
    if !current_square.empty? && current_square.color == color
      current_square.valid_moves
    else
      []
    end
  end

  def in_bounds?(pos)
    pos.all? { |n| n.between?(0, 7) }
  end

  def occupied?(pos)
    !piece_at(pos).empty?
  end

  def occupied_by_color?(pos, color)
    if occupied?(pos)
      return piece_at(pos).color == color
    end
    false
  end

  def add_piece(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end

  def piece_at(pos)
    @grid[pos[0]][pos[1]]
  end

  def perform_move(from_pos, to_pos)
    if (from_pos[0] - to_pos[0]).abs > 1
      perform_jump(from_pos, to_pos)
    else
      perform_slide(from_pos, to_pos)
    end
  end

  def perform_slide(from_pos, to_pos)
    @jumped = false
    piece = piece_at(from_pos)
    @moves << [from_pos, to_pos, piece_at(to_pos)]
    add_piece(to_pos, piece)
    add_piece(from_pos, EMPTY_SQUARE)
    piece.move_piece(to_pos)
  end

  def perform_jump(from_pos, to_pos)
    @jumped = true
    piece = piece_at(from_pos)
    @moves << [from_pos, to_pos, piece_at(to_pos)]
    add_piece(to_pos, piece)
    add_piece(from_pos, EMPTY_SQUARE)
    add_piece([(from_pos[0]+to_pos[0])/2,(from_pos[1]+to_pos[1])/2], EMPTY_SQUARE)
    piece.move_piece(to_pos)
    piece
  end


  def promote
    if @pos[0] == 0 || @pos[0] == 7
      King.new(@color, board, pos)
    end
  end

end
