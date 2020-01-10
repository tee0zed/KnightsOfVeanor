require "./Fighter.rb"
require "./Magic.rb"

class Cleric < Fighter 

include Magic 

Mana = 40
Hp = 40
Defence = 15
Damage = 4 

def initialize 
	@hp = Hp
	@mana = Mana 
	@defence = Defence
	@damage = Damage
end 


end 