
class HumanPlayer

  def initialize
  end

  def choose_position
    puts "Enter coordinates."
    inputx = gets.chomp.to_i
    inputy = gets.chomp.to_i
    return [inputx, inputy]
  end

  def feedback
  end
end
