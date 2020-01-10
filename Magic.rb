module Magic 

def hp_overload? 
	@hp = self.class::Hp if @hp > self.class::Hp
end	

def has_mana?(req_mana)
	req_mana <= @mana ? true : false 
end 

def heal
	req_mana = 10 
	if has_mana?(req_mana) 
		@hp += 8
		hp_overload?
	else 
		puts "Not enough mana!"
	end 
end 



end 