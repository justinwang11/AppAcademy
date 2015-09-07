class King < Piece

  def slide_moves
    slides_arr = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
    slides_arr = get_moves_from_array(slides_arr)
    slides_arr = slides_arr.select { |move| valid_slide?(move) }
  end

  def jump_moves
    jumps_arr = [[2, 2], [2, -2], [-2, 2], [-2, -2]]
    jumps_arr = get_moves_from_array(jumps_arr)
    jumps_arr = jumps_arr.select { |move| valid_jump?(move) }
  end

end
