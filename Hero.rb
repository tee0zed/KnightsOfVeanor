class Hero 

attr_accessor :hp, :mana 

def attack(damage, hit_chance)
#todo
end 

def defence(block_chance)
#todo
end

def whos_turn?
#todo
end 

def damage_taken=(damage)
	@hp-=damage 
end 

end 