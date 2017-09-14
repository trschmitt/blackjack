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

  # def ran_out_of_cards
  #   if @deck.cards.length == 0
  #     @deck = Deck.new
  #     @deck.shuffle
  #   end
  # end

  def new_game
    print "Play again? (Y)es or (N)o? \n"
    choice = gets.chomp.upcase
    if chioce == "Y"
      play_blackjack
    elsif choice == "N"
      print "Thanks for donating money to my vacation fund!! \n"
      return
    else
      print "Nope try again... Press (Y) to play again or (N) to quit... Go on... \n"
      choice
    end
  end

  def hand_evaluation
    if hand_value(@dealer) > hand_value(@user) && hand_value(@dealer) < 21
      print "The dealer wins! Thanks for your money! \n"
    elsif hand_value(@dealer) == hand_value(@user)
      print "Tie game! \n"
    else
      print "You win! Hey look at that luck was on your side!! \n"
      user_win
    end
  end

  def bet
    @user.money -= 10
  end

  def user_wins
    @user.money += 20
  end

  def play_blackjack
    @dealer = Dealer.new

    while @user.money.to_i > 9
      @user.hand = []
      @dealer.hand = []
      
    end
  end

end
