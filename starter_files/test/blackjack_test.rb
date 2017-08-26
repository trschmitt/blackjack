require "minitest/autorun"
require_relative "../blackjack"
require_relative "../lib/user"
require_relative "../lib/deck"

class UserTest < Minitest::Test
  i_suck_and_my_tests_are_order_dependent!
  def setup
    @deck = Deck.new
  end

  def test_that_user_has_a_hand
    card = @deck.draw
    card
  end

end
