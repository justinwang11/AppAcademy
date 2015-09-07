load 'card.rb'

class Board
  attr_reader :board
  def initialize(difficulty)
    @board = self.populate(difficulty)
  end

  def populate(difficulty)
    cards = (%w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z][0..((difficulty**2)/2)-1]* 2).map do |val|
      Card.new(val)
    end
    cards.shuffle!
    Array.new(difficulty) { Array.new(difficulty) { cards.shift }}
  end

  def render
    @board.each do |row|
      row.each { |card| print card} #.to_s implied
      puts
    end
  end


  def won?
    won = true
    @board.each do |row|
      row.each do |card|
        won = false if card.face_up == false #? not sure if redefined ==
      end
    end
    won
  end

  def reveal

  end

end
