require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def children
    moves = []
          # debugger
    (0..2).each do |row|
      (0..2).each do |col|
        if board.empty?([row,col])
          new_board = board.dup
          new_board[[row,col]] = next_mover_mark
          node = TicTacToeNode.new(new_board,choose_next,[row,col])
          moves << node
        end
      end
    end
    moves
  end

  def choose_next(mark = next_mover_mark)
    if mark == :x
      return :o
    else
      return :x
    end
  end

  def losing_node?(evaluator)
    opponent = choose_next(evaluator)
    if board.over?
      return board.winner == opponent ? true : false
    end

    if evaluator == next_mover_mark
      #our turn
      return children.all? { |child| child.losing_node?(evaluator) }
    else
      #opponent turn
      return children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    opponent = choose_next(evaluator)
    if board.over?
      return board.winner == evaluator ? true : false
    end

    if evaluator == next_mover_mark
      return children.any? { |child| child.winning_node?(evaluator) }
    else
      return children.all? { |child| child.winning_node?(evaluator) }
    end

  end
  # end
end
