require "./Hero.rb"
require "./Magic.rb"

class Battlemage < Hero

include Magic 

Mana = 60
Hp = 30
Defence = 10
Damage = 4 

def initialize 
	@hp = Hp
	@mana = Mana 
	@defence = Defence
	@damage = Damage
end 

end 
