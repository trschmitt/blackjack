require_relative "lib/game"

puts "Blackjack... The ultimate game of luck and math. Are you Ready? Leh go..."
game = Game.new
money = game.user.money
uh = game.user_hand

def begin_text(user_hand, user_money)
  print "You have #{user_money} and the bet is $10"
  print "Your hand is #{user_hand}"
end

until game.user.money == 0
  game.shuffle
  game.user_hand

  begin_text(

end
