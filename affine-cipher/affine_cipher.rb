class Affine
  # Roman alphabet affine cipher. Set class variable m
  @@m = 26

  def addkey(a, b)
    raise ArgumentError.new("Cipher key 'a' must be coprime with #{@@m}") if not coprime?(a, @@m)
    @a = a.to_i
    @b = b.to_i
  end

  def encrypt_letter(letter)
    
    # Get index position x
    # take letter, convert to uppercase, get ordinal position - 65.
    # this will give index b/w 0 and 25 (length of roman alphabet)
    x = letter.upcase.ord-65

    # encrypt letter using Affine Cipher
    e_index = (@a*x+@b)%@@m

    # convert back into letter
    return (e_index+65).chr.downcase
  end

  def coprime?(a, b)
    # Use Euclids method
    t = 0
    while (b != 0) do
      t = a
      a = b
      b = t%b
    end
    return a==1
  end


  def encode(word)
    # Initialise output
    encrypted_string = ""

    # Delete whitespace characters, punctuation using gsub regex
    word.gsub!(/[^a-z0-9]/i, '')

    # split word into letters for each letter, encode.
    word.split("").each { |letter|
      # If number, write direct to output string
      if letter.to_i.to_s == letter
        encrypted_string << letter
      else
        encrypted_string << encrypt_letter(letter)
      end
    }
    
    # format output
    # split into array of groups of 5, join array items with space
    return encrypted_string.scan(/.{1,5}/).join(" ")
  end

  def decode(word)
    
  end
end

#test = Affine.new
#test.addkey(6, 4)
#puts test.coprime?(5, 26)