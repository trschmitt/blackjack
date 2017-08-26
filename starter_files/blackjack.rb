require_relative "lib/game"

print "Blackjack... The ultimate game of luck and math. Are you Ready? Leh go..."
game = Game.new
money = game.user.money
uh = game.user.hand

def begin_text(user_hand, user_money)
  print "You have #{user_money} and the bet is $10. \n Your hand is #{user_hand}"
end

game.deck_shuffle
new_hand = game.user_hand_init

begin_text(uh, money)

until money == 0

end
