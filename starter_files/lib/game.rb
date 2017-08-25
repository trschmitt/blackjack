require_relative "deck"
require_relative "card"

class Game
  def initialize(user, dealer, deck)
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def hit
    @deck.draw
  end

  def stand
    # compare dealer hand to user hand
    # if statement that compares User hand to Dealer hand
  end

end
