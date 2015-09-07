
class WordChainer
  require 'set'
  attr_reader :dictionary
  attr_accessor :current_words, :all_seen_words

  def initialize(dictionary_file_name)
    @dictionary = Set.new
    make_dictionary(dictionary_file_name)
    @current_words = []
    @all_seen_words = Hash.new
  end

  def make_dictionary(file)
    File.foreach(file) do |line|
      @dictionary << line.chomp
    end
  end

  def adjacent_words(word)
    @dictionary.select do |dict|
      one_letter_off(word, dict)
    end
  end


  def one_letter_off(word, dict)
    return false if word.length != dict.length
    count, index = 0, 0
    while index < word.length
      count += 1 unless word[index] == dict[index]
      index += 1
    end
    return true if count == 1
    false
  end

  def run(source, target)
    @current_words << source
    @all_seen_words[source] = nil
    until @current_words.empty? || @all_seen_words.keys.include?(target)
      new_current_words = []
      explore_current_words(new_current_words)
      @current_words = new_current_words
    end
    build_path(target)
  end

  def explore_current_words(array)
    @current_words.each do |word|
      adjacent_words(word).each do |adjacent|
        unless @all_seen_words.include?(adjacent)
          @all_seen_words[adjacent] = word
          array << adjacent
        end
      end
    end
    display_source(array)
  end

  def display_source(array)
    array.each do |word|
      puts "#{word} => #{@all_seen_words[word]}"
    end
  end

  def build_path(target)
    return if target.nil?
    puts target
    value = @all_seen_words[target]
    build_path(value)
  end
end

w = WordChainer.new("dictionary.txt")

w.run("market", "marker")
