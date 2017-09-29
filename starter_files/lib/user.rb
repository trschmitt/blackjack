require_relative "player"

class User < Player
  attr_accessor :money

  def initialize
    super
    @money = 100
  end

  def bet
    @money -= 10
  end

  def win
    @money += 20
  end
end
