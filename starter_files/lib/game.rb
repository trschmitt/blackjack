require_relative "card"
require_relative "deck"
require_relative "dealer"
require_relative "user"

class Game

  attr_accessor :user, :dealer, :deck

  def initialize
    @user = User.new
    @deck = Deck.new
    @deck.shuffle
  end

  def hand_value(player)

    total = player.hand.reduce(0) do |acc, x|
      if x.rank.to_s == "J" || x.rank.to_s == "Q" || x.rank.to_s == "K"
        acc + 10
      elsif x.rank.to_s == "A"
        acc + 1
      else
      acc + x.rank.to_i
      end
    end

    player.hand.each do |ace|
      if ace.rank.to_s == "A" && total.to_i <= 10
        total += 10
      end
    end

    total

  end

  def hit(player)
    player.hand << @deck.draw
  end

  def dealer_special
    while hand_value(@dealer) < 17
      hit(@dealer)
    end
    if hand_value(dealer) == 21
      print "Dealer's hand is 21... They beat you... Try again mate! \n"
      new_game
    else
      print "Dealer's hand is #{hand_value(@dealer)}.\n Your move! \n"
    end
  end

  def ran_out_of_cards
    if @deck.cards.length == 0
      @deck = Deck.new
      @deck.shuffle
    end
  end

  def method
    #code
  end

end
