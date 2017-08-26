require_relative "lib/deck"
require_relative "lib/card"
require_relative "lib/user"
require_relative "lib/dealer"

puts "Blackjack... The ultimate game of luck and math. Are you Ready? Leh go..."
class Game

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deck_shuffle
    @deck.shuffle
  end

  def user_hand
    @deck.draw * 2 << @user.hand
  end

  def user_move
    while true
      print "Do you want to (h)it or (s)tand?:"
      answer = gets.chomp.downcase
      if answer[1] == "h"
        @deck.draw << @user.hand
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

  end

  def dealer

  end

end
