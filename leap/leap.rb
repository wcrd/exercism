module BookKeeping
    VERSION = 3
end

class Year
    def self.leap?(year)
        return false unless year%4==0
        return true unless year%100==0
        return true if year%400===0
        return false
    end
end