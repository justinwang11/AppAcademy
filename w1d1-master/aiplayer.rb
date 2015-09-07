class AIPlayer

  def initialize(difficulty)
    @aiboard = Array.new(difficulty) {Array.new(difficulty)}
  end

  def choose_position
    p @aiboard
    inputx = gets.chomp.to_i
    inputy = gets.chomp.to_i
    return [inputx, inputy]
  end

  def feedback

    
  end


end
