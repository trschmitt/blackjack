require_relative "deck"

class User
  attr_accessor :hand, :money, :ace_count, :hand_value

  def initialize
    @hand = []
    @hand_value = 0
    @money = 100
    @ace_count = ace_count
  end

end
