require "./Cleric.rb"
require "./Battlemage.rb"
require "./Knight.rb"
require "./Thief.rb"
require "./abilities.rb"
require "./game.rb"

require 'byebug'




game = Game.new

loop do 
	
	game.new_turn 
	
end 
	
