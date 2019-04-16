require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

p1 = Player.new("roro")
p2 = Player.new("toto")
	
	while p1.life_points > 0 && p2.life_points > 0
			
		puts "-------------------"
		puts "Voici leur état: #{p1.show_state} et #{p2.show_state} !"
		puts "Passons à la phase d'attaque !"
		puts "-------------------"
		p1.attacks(p2)
		puts "-------------------"
		break if p2.life_points <= 0
		p2.attacks(p1)
		
	end 

binding.pry
