require_relative "deck"
require_relative "card"

class Game
  def initialize(user, dealer)
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
    @dealer = Dealer.new
    @User = User.new
  end

  @deck.shuffle

  @deck.draw * 2
  @deck.draw * 2 



end
