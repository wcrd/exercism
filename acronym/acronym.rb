module Acronym
  REG_EX = /\b([a-zA-Z])/

  def self.abbreviate(phrase)
    phrase.scan(REG_EX).join.upcase
  end
end
