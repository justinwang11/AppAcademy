# require_relative 'board.rb'

class Tile
  attr_accessor :bomb, :flagged, :hidden
  DELTAS =
     [[-1, 0],
     [1, 1],
    [-1, -1],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0]]
  def initialize(pos)
    @flagged = false
    @bomb = false
    @hidden = true
    @pos = pos
  end

  def neighbors
    # take the position of current tile, use deltas as lookups for
    # the board to get associated neighbor tiles
    neighbor_positions = []
    DELTAS.each do |offset|
      new_position = [pos[0] + offset[0], pos[1] + offset[1]]
      neighbor_positions << @grid[new_position]
    end
    neighbor_positions
  end

  def neighbor_bomb_count
    count = 0
    neighbors.each do |neighbor|
      count += 1 if neighbor.bomb == true
    end
    count
  end

  def uncover_adjacents
      # uncover neightbors who aren't bombs
      # if any are null tiles, add them to queue
    self.each do |neighbor|
      if neighbor.neighbor_bomb_count > 0
        neighbor.hidden = false
      else
        neighbor.hidden = false
        neighbor.uncover_adjacents
      end
    end
  end




end
