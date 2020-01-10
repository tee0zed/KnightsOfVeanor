require "./Cleric.rb"
require "./Battlemage.rb"
require "byebug"

davin = Battlemage.new 
markus = Cleric.new
davin.mana = 1
puts "Davin hp is #{davin.hp}"
puts "Markus hp is #{markus.hp}"
puts "Davin mana is #{davin.mana}"
puts "Markus mana is #{markus.mana}"
puts "Davin casting fireball on Markus"
markus.damage_taken = davin.fireball 
puts "Davin hp is #{davin.hp}"
puts "Markus hp is #{markus.hp}"
puts "Davin mana is #{davin.mana}"
puts "Markus mana is #{markus.mana}"
puts "Markus attack Davin"
davin.damage_taken = markus.attack 
puts "Davin hp is #{davin.hp}"
puts "Markus hp is #{markus.hp}"
puts "Davin mana is #{davin.mana}"
puts "Markus mana is #{markus.mana}"
