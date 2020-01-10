require "./Fighter.rb"
require "./Magic.rb"

class Battlemage < Fighter

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
