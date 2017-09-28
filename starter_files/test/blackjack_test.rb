require "minitest/autorun"
require_relative "../lib/game"

class GameTest < Minitest::Test

  def test_the_universe_still_works
    assert true == true
  end

  def setup
    @game = Game.new
    @user = User.new
    @dealer = Dealer.new
  end

  def test_user_bet
    @user.money -= 10

    assert_equal @user.money, 90
  end

  def test_user_hand_contains_cards
    2.times{ @game.hit(@user) }

    refute_empty @user.hand
  end

  

end
