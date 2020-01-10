require "./Hero.rb"
require "./Heal.rb"

class Battlemage < Hero

include Heal 

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

def fireball 
	req_mana = 6 
	if has_mana?(req_mana) 
		@mana-=req_mana 
		rand(6..10)
	end 
end 

def shield 
	req_mana = 5 
	if has_mana?(req_mana)
		@mana-=req_mana 
	end 
end 

end 
