module Acronym
  REG_EX = /([a-zA-Z])[a-zA-z]*/

  def self.abbreviate(phrase)
    phrase.scan(REG_EX).join.upcase
  end
end
