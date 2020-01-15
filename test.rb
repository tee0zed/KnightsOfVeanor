require "./Cleric.rb"
require "./Battlemage.rb"
require "./Knight.rb"
require "./Thief.rb"
require "./abilities.rb"
require "./game.rb"

require 'byebug'




game = Game.new


loop do 
	game.cli 
	game.new_turn 
	game.cli
end 
	
