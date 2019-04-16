require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------------
			WESH ! 
BIENVENUE DANS CE JEU OU IL FAUT TUER TOUT LE MONDE !
		(MIEUX QUE FORTNITE) 
------------------------------------------------------"
puts "C'est quoi ton blaze ?"
print ">"
@name = gets.chomp.to_s

humanplayer = HumanPlayer.new("#{@name}")

cpu1 = Player.new("Roro")
cpu2 = Player.new("Toto")
ennemies = [cpu1, cpu2]

while (cpu1.life_points > 0 || cpu2.life_points > 0) && humanplayer.life_points > 0
	
	puts humanplayer.show_state
	puts "Quelle action veux-tu effectuer ?
-----------------------------------------------------
a - Looter du gros stuff ?
s - Chercher à se heal ? 

attaquer un joueur en vue :
0 - #{cpu1.show_state}
1 - #{cpu2.show_state}
-----------------------------------------------------"
	print ">"
choice = gets.chomp.to_s
	humanplayer.search_weapon if choice == "a"
	humanplayer.search_health_pack if choice == "s"
	humanplayer.attacks(cpu1) if choice == "0"
	humanplayer.attacks(cpu2) if choice == "1"
puts"------------------------------------------------"
	puts "Les instances de la Class Player t'attaquent !"
puts"------------------------------------------------"

	ennemies.each do |ennemy|
		ennemy.attacks(humanplayer)
	end



end


#puts if
#puts if 
binding.pry