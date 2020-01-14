require "./Cleric.rb"
require "./Battlemage.rb"
require "./Knight.rb"
require "./Thief.rb"
require "./magic.rb"
require "./game.rb"

require 'byebug'



player1 = Game.hero_create
player2 = Game.hero_create
game = Magic.new(player1, player2)
byebug
game.magic[curse]
#Game.cli(player1, player2)
#Game.ability_choise(player1)
#Game.cli(player1, player2)

	
