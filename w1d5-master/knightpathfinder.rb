require_relative '00_tree_node'

class KnightPathFinder
  attr_reader :visited_positions, :start_pos
  def initialize(pos)
    @start_pos = pos
    @visited_positions = [@start_pos]
    @tree = build_move_tree
  end

  def build_move_tree
    queue = []
    tree = []
    queue << PolyTreeNode.new(start_pos)
    until queue.empty?
      current_node = queue.shift
      tree << current_node
      possible_moves = new_move_positions(current_node.value)
      possible_moves.each do |move|
        node = PolyTreeNode.new(move)
        if !node.nil?
          current_node.add_child(node)
          queue << node
        end
      end
    end
    tree
  end

  def find_path(end_pos)
    end_node = @tree[0].bfs(end_pos)
    end_node.trace_back_path.map { |node| node.value }
  end

  def self.valid_moves(pos)
    return [] if pos.nil?
    result = []
    row, col = pos[0], pos[1]
    result << [row+2,col+1]
    result << [row+2,col-1]
    result << [row-2,col+1]
    result << [row-2,col-1]
    result << [row+1,col+2]
    result << [row+1,col-2]
    result << [row-1,col+2]
    result << [row-1,col-2]
    result.select do |pos|
      pos.all? { |coord| (0..7).include?(coord) }
    end
  end

  def new_move_positions(pos)
    return [] if pos.nil?
    new_positions = self.class.valid_moves(pos).select do |p|
      !visited_positions.include?(p)
    end
    visited_positions.concat(new_positions)
    new_positions
  end

end

k = KnightPathFinder.new([0,0])
p k.find_path([6,2])
