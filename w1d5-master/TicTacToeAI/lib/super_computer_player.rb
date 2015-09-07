require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer

  def move(game, mark)
    @root = TicTacToeNode.new(game.board, mark)
    kids = @root.children
    no_losers = kids.select { |kid| !kid.losing_node?(mark) }
    raise Error if no_losers.empty?
    no_losers.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end
    no_losers.sample.prev_move_pos
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
