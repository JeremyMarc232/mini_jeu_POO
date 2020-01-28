require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
puts "\n\n"
puts "     =====  ----  ====="
puts "BIENVENUE DANS LE GAME CHAMPION"
puts "    Prêt pour le combat?"
puts "     =====  ----  ====="
puts "\n\n"
puts "Quel est ton prénom ?"
print ">"
user = HumanPlayer.new(gets.chomp)
puts "Bienvenue, #{user.name} !"

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "#{user.show_state}"
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"
  puts "Quelle action veux-tu effectuer?\n\n"
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner"
  puts "\nAttaquer un joueur en vue :\n\n"
  print "0 -"
  print "#{player1.show_state}"
  print "1 -"
  print "#{player2.show_state}"
  puts "\nTon choix :"
  print ">"
  entry = 0    
  entry = gets.chomp.to_s
  if entry == "a"
    user.search_weapon

  elsif entry == "s"
    user.search_health_pack

  elsif entry == "0"
    user.attacks(player1)

  elsif entry == "1"
    user.attacks(player2)

  else puts "Tu t'es trompé(e) ! Utilise a, s, 0, 1 ;)"

  end

  puts "En garde, les autres joueurs t'attaquent !!"
  
  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    else 
    end
  end
end