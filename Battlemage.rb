require "./Hero.rb"
require "./Magic.rb"

class Battlemage < Hero

include Magic 

Mana = 60
Hp = 30
Defence = 1
Damage = 3
Hit_chance = 4 

def initialize 
	@hp = Hp
	@mana = Mana 
	@defence = Defence
	@damage = Damage
	@hit_chance = Hit_chance
end 

end 
