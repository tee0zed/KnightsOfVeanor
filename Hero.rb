class Hero 

attr_accessor :hp, :mana 

def attack
	if rand(@hit_chance..10) > rand(0...10)+1
		@damage
	else 
		return 0 
	end 
end 

def defence(block_chance)
#todo
end

def my_turn?
#todo
end 

def damage_taken=(damage)
	if damage > @defence
		damage-=@defence 
		@hp-=damage
	elsif damage.between?(1, @defence)
		puts "Attack has been blocked!"
	elsif damage == 0
		puts "Miss!"
	end 
end 

end 