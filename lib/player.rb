
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} point(s) de vie!"
  end

  def gets_damage(damage)
     @life_points -= damage
     if @life_points <= 0
      puts "\nLe joueur #{@name} a été tué !"
     end
  end

  def attacks(player)
    puts "Le joueur #{@name} attaque le joueur #{player.name} !"
    dmg = compute_damage
    puts "Il lui inflige #{dmg} point(s) de dégât(s)"
    player.gets_damage(dmg)
    
  end
  
  def compute_damage
    return rand(1..6)
  end

end