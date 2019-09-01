class Scrabble

  VALUE_HASH = {
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"] =>                                         2,
    ["B", "C", "M", "P"] =>                               3,
    ["F", "H", "V", "W", "Y"] =>                          4,
    ["K"] =>                                              5,
    ["J", "X"] =>                                         8,
    ["Q", "Z"] =>                                         10
  }

  def initialize(word)
    @letters = word.strip.upcase.chars
  end

  def score
    # init
    score = 0
    # count letters, find value in VALUE_HASH, calc score
    count_letters.each { |letter, count| score += count*letter_value(letter) }
    score
  end

  def self.score(word)
    @letters = word.upcase.chars
    score
  end

  private

  def count_letters
    @letters.each_with_object(Hash.new(0)) { |letter, count| count[letter] += 1 }
  end

  def letter_value(letter)
    VALUE_HASH.select { |key, value| key.include? letter }.values.first
  end
end