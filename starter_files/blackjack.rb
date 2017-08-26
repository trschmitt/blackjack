require_relative "../lib/deck"
require_relative "../lib/card"
require_relative "../lib/user"
require_relative "../lib/dealer"

puts "Blackjack... The ultimate game of luck and math. Are you Ready? Leh go..."
game_deck = Deck.new


dame_deck.shuffle

game_deck.draw * 2 << @
game_deck.draw * 2 << @user.hand

class Game
  def initialize(user, dealer, deck)
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deck_shuffle
    @deck.shuffle
  end

  def user_hit
    @deck.draw << @user.hand
  end

  def user_hand_value

  end

  def stand

  end

end
