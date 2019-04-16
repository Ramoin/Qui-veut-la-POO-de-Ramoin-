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
		puts "il lui inflige #{damages} dégats!"
	end 

	def compute_damage
    	return rand(1..6)
  	end
end



