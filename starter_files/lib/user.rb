class User
  attr_accessor :hand, :money, :ace_count, :hand_value

  def initialize
    @hand = []
    @hand_value = 0
    @money = 100
  end

  def hand
    @hand
  end

  def hand_value
    @hand_value
  end

  def money
    @money
  end

end
