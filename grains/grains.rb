module BookKeeping
    VERSION = 1
end

class Grains

  MIN_SQUARE_NUMBER = 1
  MAX_SQUARE_NUMBER = 64

  def self.square(n)
    # returns the number of grains on the n_th square
    raise ArgumentError unless n.between?(MIN_SQUARE_NUMBER,MAX_SQUARE_NUMBER)
    return 2**(n-1)
  end

  def self.total
    # returns total number of grains on the 64 square board
    (MIN_SQUARE_NUMBER..MAX_SQUARE_NUMBER).sum { |item| self.square(item) }
    
    # Alternative.
    # use sum of exponents formula Sig_xn = (x^(n+1)-1)/(x-1)
    # since self.square takes max n = 64, multiply by 2 to get 2^65
    #return 2*self.square(64)-1
  end
end