require 'bundler'
Bundler.require
require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "A ma droite, la valeureuse #{player1.name}!\n\n"
puts "A ma gauche, l'indétrônable #{player2.name}!\n\n"

while player1.life_points > 0 && player2.life_points > 0
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"
  puts "----------------------"
  puts "Passons à la phase d'attaque!"
  puts "----------------------\n\n"
  player1.attacks(player2)
  break puts "\n\n----- FIGHT IS OVER -----\n\n" if player2.life_points <= 0
  player2.attacks(player1)
  puts "\n\n"
end