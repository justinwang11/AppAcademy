require_relative 'tile.rb'
require 'byebug'

class Board
 attr_reader :bomb_num
 attr_accessor :grid

  # def grid
  #   @grid
  # end
  #
  # def grid=(val)
  #   @grid = val
  # end

  def initialize(size, bomb_num)
    grid = Array.new(size) { Array.new(size) }
    @grid = grid
    @bomb_num = bomb_num
    populate_board
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def populate_board
    make_tiles
    make_bombs
  end

  def make_tiles
    @grid.each_with_index do |row, j|
      row.each_with_index do |_, i|
        row[i] = Tile.new([j,i])
      end
    end
  end


  def valid_position?(pos)
    pos[0].between?(0,8) && pos[1].between?(0,8)
  end


  def make_bombs
    bomb_num.times do
      bomb_placed = false
      until bomb_placed
        random_row = rand(grid.size)
        random_col = rand(grid.size)
        pos = [random_row, random_col]
          # grid[random_row][random_col]
          # self.[](pos) = Tile.new(bomb)
        self[pos].bomb = true
          # grid(pos) = Tile.new(bomb)
        bomb_placed = true
      end
    end
  end

  def render
    print "  "
    (0..8).each do |i|
      print "#{i} "
    end
    # debugger
    grid.each_with_index do |row, i|
      print "\n#{i} "
      row.each do |tile|
        if tile.hidden && tile.flagged
          print "⛳"
        elsif tile.hidden && !tile.flagged
          print "■ "
        elsif !tile.hidden
          print tile.neighbor_bomb_count if tile.neighbor_bomb_count > 0
          print "  " if tile.neighbor_bomb_count == 0
        end
        # else tile.bomb == false
        #   print "_ "
        # elsif tile.bomb == true
        #   print "* "
      end
    end
    puts
  end

end

# b = Board.new(9,5)
# b.render
# blank = ■
# hidden = ▨
# bomb = 💣
# flag = ⚐⛳
