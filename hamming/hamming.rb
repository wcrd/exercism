module BookKeeping
  VERSION = 3
end

module Hamming
# takes two DNA strings of equal length and calculates hamming distance

  def self.compute(dna_a="", dna_b="")
    raise ArgumentError.new("DNA strands must be of equal length to compute Hamming distance") unless dna_a.length==dna_b.length

    # split strings
    s1 = dna_a.chars
    s2 = dna_b.chars
    
    # compare strings
    s1.zip(s2).count { |x,y| x!=y }
    
  end

end
