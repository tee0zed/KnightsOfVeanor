require "./Cleric.rb"
require "./Battlemage.rb"
require "./Knight.rb"
require "./Thief.rb"
require "./magic.rb"
require "./game.rb"

require 'byebug'

game = Game.new
player1 = nil
player2 = nil
player1 = Game.hero_create
player2 = Game.hero_create

loop do 
	
