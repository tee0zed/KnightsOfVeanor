require "./Cleric.rb"
require "./Battlemage.rb"
require "byebug"

davin = Battlemage.new 
markus = Cleric.new
puts markus.mana
markus.hp = 20 
davin.hp = 15
puts "Markus hp is #{markus.hp}"
1.times{markus.heal} 
puts "Davin hp is #{davin.hp}"
puts "healing davin and markus" 
davin.heal
davin.heal
davin.heal
puts "Davin hp is #{davin.hp}"
puts "Markus hp is #{markus.hp}"
puts "Davin mana is #{davin.mana}"
puts "Markus mana is #{markus.mana}"
puts "Davin if casting fireball on Markus"
markus.damage_taken = davin.fireball 
puts "Davin hp is #{davin.hp}"
puts "Markus hp is #{markus.hp}"
puts "Davin mana is #{davin.mana}"
puts "Markus mana is #{markus.mana}"

