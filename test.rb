require "./Cleric.rb"
require "./Battlemage.rb"
require "byebug"

davin = Battlemage.new 
markus = Cleric.new
puts markus.mana
markus.hp = 20 
davin.hp = 15
puts "Markus hp is #{markus.hp}"
5.times{markus.heal} 
puts "Davin hp is #{davin.hp}"
puts "healing davin and markus" 
davin.heal
puts "Davin hp is #{davin.hp}"
puts "Markus hp is #{markus.hp}"
byebug
