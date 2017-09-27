require_relative "card"
require_relative "deck"
require_relative "dealer"
require_relative "user"
require "byebug"

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

    player.hand.each do |card|
      if card.rank.to_s == "A" && total.to_i <= 10
        total + 10
      end
    end

    total

  end

  def hit(player)
    player.hand.unshift(@deck.draw)
  end

  def dealer_special
    while hand_value(@dealer) < 17
      hit(@dealer)
    end
    if hand_value(@dealer) == 21
      print "Dealer's hand is 21... They beat you... Try again mate! \n"
      new_game
    elsif hand_value(@dealer) > 21
      print "Dealer busted you win!!\n"
      new_game
    else
      print "Dealer's hand is #{hand_value(@dealer)}.\n"
    end
  end

  def new_game
    print "Play again? (Y)es or (N)o? \n"
    choice = gets.chomp.upcase
    if choice == "Y"
      play_blackjack
    elsif choice == "N"
      print "Thanks for donating money to my vacation fund!! \n"
      exit
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
      print "You win! Hey look at that luck was on your side!! Unless you are counting.... -.-\n"
      user_wins
    end
  end

  def bet
    @user.money -= 10
  end

  def user_wins
    @user.money += 20
  end

  def play_blackjack
    # byebug
    @dealer = Dealer.new

    while @user.money.to_i > 9
      @user.hand = []
      @dealer.hand = []
      @deck.shuffle
      2.times { hit(@user) }
      2.times { hit(@dealer) }
      print "This... is Blackjack... Shall we? \n $#{@user.money} is how much you came in with... How much will you leave with? Table bet is $10. \n Your hand is: #{@user.hand[0].rank} of #{@user.hand[0].suit.upcase}, #{@user.hand[1].rank} of #{@user.hand[1].suit.upcase} which means your total hand value is #{hand_value(@user)}\n (H)it or (S)tand?\n"
      bet

      move = gets.chomp.upcase
      until hand_value(@user) >= 21 || move == "S"
        # move = gets.chomp.upcase
        if move == "H"
          hit(@user)
          print "You hit and add #{@user.hand[0].rank} of #{@user.hand[0].suit.upcase} to your hand.\n New total is #{hand_value(@user)}. Do you (H)it or (S)tand?\n"
          move = gets.chomp.upcase
        elsif move != "S" || move != "H"
          print "Come on... Only two letters to choose from... Which shall it be (H) or (S)?\n"
          move = gets.chomp.upcase
        else
          dealer_special
        end
      end

        if hand_value(@user) > 21
          print "BUSTED! Better luck next time.\n"
          new_game
        elsif hand_value(@user) == 21
          print "Well would you look at that... You hit 21 you win... Lucky\n"
          user_wins
          new_game
        else
          print "Dealer's hand is: #{@dealer.hand[0].rank} of #{@dealer.hand[0].suit.upcase}, #{@dealer.hand[1].rank} of #{@dealer.hand[1].suit.upcase} which means their total hand value is #{hand_value(@dealer)}\n"
          hand_evaluation
          new_game
        end

        if @user.money.to_i < 9
          print "You don't have any money left mate..."
        end
    end
  end
end
