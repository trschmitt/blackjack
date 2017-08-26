class Dealer
  attr_accessor :hand, :hand_value

  def initialize
    @hand = []
    @hand_value = 0
  end

  def hand
    @hand
  end

  def hand_value
    @hand_value
  end
end
