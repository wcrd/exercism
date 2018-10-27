module Isogram
  def self.isogram?(word)
    letters = word.downcase.delete('^a-z').chars
    letters == letters.uniq
  end
end
