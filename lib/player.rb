class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} est #{@life_points} pieds sous terre"
    else puts "#{@name} a #{@life_points} point(s) de vie"
    end
    
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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level}!"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une nouvelle arme de niveau #{new_weapon_level} !"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
    
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé"
    elsif health_pack <= 5
      @life_points += 50
      if @life_points > 100
        @life_points = 100
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie ! Tu as maintenant #{@life_points} points de vie"
    else
      @life_points += 80
      if @life_points > 100
        @life_points = 100
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie ! Tu as maintenant #{@life_points} points de vie"
    end
  end
end