require "./lib/heroes/Cleric.rb"
require "./lib/heroes/Battlemage.rb"
require "./lib/heroes/Knight.rb"
require "./lib/heroes/Thief.rb"
require "./lib/abilities.rb"
require "./lib/game.rb"

puts File.open("./lib/logo"){|f| f.read}

sleep 1 

Game.clear

game = Game.new

game.game_start  
	 
	
