module BookKeeping
  VERSION = 2
end

module RomanNumerals
  module RomanNumeralConsts
    # Const. Hash of Roman Numeral mappings.
    ROMAN_NUMERALS = {
      1 => "I",
      2 => "II",
      3 => "III",
      4 => "IV",
      5 => "V",
      6 => "VI",
      7 => "VII",
      8 => "VIII",
      9 => "IX",
      10 => "X",
      40 => "XL",
      50 => "L",
      60 => "LX",
      70 => "LXX",
      80 => "LXXX",
      90 => "XC",
      100 => "C",
      400 => "CD",
      500 => "D",
      600 => "DX",
      700 => "DXX",
      800 => "DXXX",
      900 => "CM",
      1000 => "M"
    }
  end

  module RomanNumeralMethods
    # Keep Roman numeral methods in this module. Include in the Fixnum class.
    include RomanNumeralConsts
    
    def to_roman
      # init output
      output = ""
      # get integer position values
      a = split_int(self).reverse!
      # convert each position to roman
      a.each_with_index { |item, i| 
        # set item 10's
        tens = 10**i
        # get roman numeral
        roman_num = ROMAN_NUMERALS.fetch(item*tens, ROMAN_NUMERALS[tens]*item)
        # add to roman num output
        output.prepend(roman_num)
      }
      return output
    end

    private

    def split_int(num)
      raise ArgumentError.new("Integers only") unless num.integer?
      a = []
      until num.zero?
        num, r = num.divmod(10)
        a.unshift(r)
      end
      return a
    end
  end
end

Fixnum.include RomanNumerals::RomanNumeralMethods

