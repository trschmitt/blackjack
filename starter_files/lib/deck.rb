require_relative "card"

class Deck
  attr_reader :cards, :ranks
  SUITS = [:clubs, :diamonds, :hearts, :spades]

  def initialize
    @cards = []
    @ranks = Card::RANKS
    SUITS.each do |suit|
      @ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def cards_left
    @cards.length
  end

  def draw
    @cards.shift
  end

  def shuffle
    @cards = @cards.shuffle
  end
end
