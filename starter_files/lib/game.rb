require_relative "deck"
require_relative "card"
require_relative "user"
require_relative "dealer"

class Game

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def user
    @user
  end

  def dealer
    @dealer
  end

  def deck
    @deck
  end

  def deck_shuffle
    deck.shuffle
  end

  def user_hand_init
    2.times do
      card = deck.draw

    end
  end

  def user_move
    while true
      print "Do you want to (h)it or (s)tand?:"
      answer = gets.chomp.downcase
      if answer[1] == "h"
        user.hand << deck.draw
        return true
      elsif answer[1] == "s"
        return true
      else
        return false
      end
      print "Try again brah..."
    end
  end

  def user_hand_value
    # if Card.value == 1
    #   @user.hand_value += 11
    # elsif Card.value == 2..10
    #   @user.hand_value += Card.value
    # end
  end

  def dealer

  end

  def ace_count

  end
  # official ACE rules The combination of an ace with a card other than a ten-card is known as a "soft hand," because the player can count the ace as a 1 or 11, and either draw cards or not. For example with a "soft 17" (an ace and a 6), the total is 7 or 17. While a count of 17 is a good hand, the player may wish to draw for a higher total. If the draw creates a bust hand by counting the ace as an 11, the player simply counts the ace as a 1 and continues playing by standing or "hitting" (asking the dealer for additional cards, one at a time).

  def ran_out_of_cards
    if @deck.cards_length == 0
      @deck = Deck.new
      @deck.shuffle
    end

  end

end
