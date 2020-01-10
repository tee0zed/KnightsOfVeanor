require "./Hero.rb"
require "./Magic.rb"

class Cleric < Hero 

include Magic 

Mana = 40
Hp = 40 
Defence = 4
Damage = 5
Hit_chance = 7

def initialize 
	@hp = Hp
	@mana = Mana 
	@defence = Defence
	@damage = Damage
	@hit_chance = Hit_chance
end 

end 