require 'pry'

class Player
	attr_accessor :name, :life_points
	
	def initialize(name)
		@name = name.to_s
		@life_points = 10
	end

	def show_state
		return "#{@name} a #{@life_points} PV"
	end

	def gets_damage(taken_damages)
		@life_points = @life_points - taken_damages
		if @life_points <= 0
			puts "#{@name} est mort!"
		end
	end

	def attacks(attacked_player)
		puts "#{@name} attaque #{attacked_player.name}!"
		damages = compute_damage
		attacked_player.gets_damage(damages)
		puts "Il lui inflige #{damages} dégats!"
	end 

	def compute_damage
    	return rand(1..6)
  	end
end

class HumanPlayer < Player
	attr_accessor :name, :life_points, :weapon_level

	def initialize(name)
		@name = name.to_s
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		return "#{@name} a #{@life_points} PV et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
    	rand(1..6) * @weapon_level
  	end

  	def search_weapon
  		random_level = rand(1..6)
  		puts "Cette arme est lvl#{random_level} !"
  		if random_level > @weapon_level
  			@weapon_level = random_level
  			puts "C'est de la bombe! je prend !"
  			else puts "C'est de la merde !"
  		end

	end

	def search_health_pack
		random_health = rand(1..6)
		if random_health == 1
			puts "Pas de chance !"
			elsif random_health == 6
				puts "Gros pack de santé !"
				@life_points = @life_points + 80
				else puts "Petit pack de santé !"
				@life_points = @life_points + 50
		end
			@life_points = 100 if @life_points > 100
	end

end






