class Board

  def initialize
    @grid = Array.new(7) { Array.new (6), "o" }
  end

  def drop_disc(column, disc)
    @grid[column].map do |space|
      debugger
      if space == "o"
        space = disc
        break
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def[]=(pos,value)
    row, col = pos
    grid[row][col] = value
  end

  def over?
    winner
  end

  def render
    @grid.each do |row|
      p row
    end
  end

  def winner
    if check_vertical
      @winner = check_vertical
    elsif check_horizontal
      @winner = check_horizontal
    elsif check_diagonal_pospos
      @winner = check_diagonal_pospos
    elsif check_diagonal_posneg
      @winner = check_diagonal_posneg
    else
      false
    end
  end

  def check_vertical
    @grid.each do |row|
      current_position = 0
      while current_position < 4
        if row[0+current_position..3+current_position].uniq.count == 1 &&
          !row[0+current_position..3+current_position].uniq.include?("o")
          return row[0+current_position..3+current_position].uniq
        end
      current_position += 1
      end
    end
    false
  end

  def check_horizontal
    transposed_grid = @grid.transpose
    transposed_grid.each do |row|
      current_position = 0
      while current_position < 4
        if row[0+current_position..3+current_position].uniq.count == 1 &&
          !row[0+current_position..3+current_position].uniq.include?("o")
          return row[0+current_position..3+current_position].uniq
        end
      current_position += 1
      end
    end
    false
  end

  def check_diagonal_pospos
    @grid[3..6].each_with_index do |col, j|
      col[3..5].each_with_index do |el, i|
        arr = []
        count = 0
        while count < 4
          arr << @grid[j - count][i - count]
          count += 1
        end
        if arr.uniq.count == 1 && !arr.uniq.include?("o")
          return arr.uniq
        end
      end
    end
    false
  end

  def check_diagonal_posneg
    @grid[0..3].each_with_index do |col, j|
      col[3..5].each_with_index do |el, i|
        arr = []
        count = 0
        while count < 4
          arr << @grid[j - count][i + count]
          count += 1
        end
        if arr.uniq.count == 1 && !arr.uniq.include?("o")
          return arr.uniq
        end
      end
    end
    false
  end

end
