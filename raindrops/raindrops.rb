module BookKeeping
  VERSION = 3
end

module Raindrops
  def self.convert(number)
    output = ""
    output << "Pling" if number%3==0
    output << "Plang" if number%5==0
    output << "Plong" if number%7==0
    output << number.to_s if output.empty?
    return output
  end
end