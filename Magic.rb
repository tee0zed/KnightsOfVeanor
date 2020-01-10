module Magic 

def hp_overload? 
	@hp = self.class::Hp if @hp > self.class::Hp
end	

def has_mana?(req_mana)
	if req_mana <= @mana 
		true 
	else 
		false
		puts "Not enough mana!"
	end 
end 

def heal
	req_mana = 10 
	if has_mana?(req_mana)
		@mana-=req_mana
		@hp += 8
		hp_overload?
	end 
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