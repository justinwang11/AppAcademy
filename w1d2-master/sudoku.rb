require 'colorize'
require 'byebug'

class Tile
  attr_reader :given
  attr_accessor :value

  def initialize(value)
    @value = value
    @given = value != "0"
  end

  def check_given
    @given
  end

  def to_s
    check_given ? value.colorize(:blue) : value
  end

end

class Board
attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file_name)
    puzzle = File.readlines(file_name)

    puzzle.map! do |row|
      row.chomp.split("")
    end

    grid = puzzle.map do |row|
      row.map { |value| Tile.new(value) }
    end

    Board.new(grid)
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def[]=(pos,value)
    row, col = pos
    grid[row][col].value = value
  end

  def set_tile

  end

  def render
    @grid.each do |row|
      puts "#{row.join(" ")}"
    end
  end

  def solved?
    check_rows && check_cols && check_3x3
  end



  def check_rows
    arr = []
    @grid.each do |row|
      row.each do |tile|
        arr << tile.value
      end
      (1..9).each do |el|
        if !arr.include?(el.to_s)
          return false
        end

      end

    end
    true
  end

  def check_cols

    arr = []
    transposed_grid = @grid.transpose
    transposed_grid.each do |row|
      row.each do |tile|
        arr << tile.value
      end
      (1..9).each do |el|
        if !arr.include?(el.to_s)
          return false
        end

      end

    end
    true

  end

  def check_3x3

    row = 0
    while row < 9
      column = 0
      while column < 9
        arr = []
        @grid[row..row+2].each do |r|

          r[column..column+2].each do |el|
            arr << el.value
          end


        end
        (1..9).each do |el|

          if !arr.include?(el.to_s)
            return false
          end

        end
        column += 3
      end
      row += 3
    end
    true
  end

end

class Game
  attr_reader :board

  def initialize(grid)
    @board = Board.from_file(grid)
  end

  def play

    until board.solved?
      play_turn
    end
    puts "Congrats, you won!"
  end

  def play_turn

    board.render
    move = prompt
    board[move.first] = move.last.to_s

  end

  def parse(string)
    string.split(",").map! { |x| x.to_i }
  end

  def prompt
    position = nil

    until position && valid_position?(position) && !board[position].given
      puts "Please input a position"
      position = parse(gets.chomp)
    end

    value = nil
    until value && valid_number?(value)
      puts "Please input a number"
      value = gets.chomp.to_i
    end

    move = [position,value]
  end

  def valid_position?(pos)
    pos.count == 2 && pos.all? { |x| x.between?(0, 9) }
  end

  def valid_number?(number)
    number > 0 && number < 10
  end

end


file_name = gets.chomp
Game.new(file_name).play
