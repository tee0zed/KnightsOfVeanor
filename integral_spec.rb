require 'rspec'

require 'byebug'

require './lib/game.rb'
require './lib/abilities.rb'
require './lib/hero.rb'
require './lib/heroes/Knight.rb'
require './lib/heroes/Battlemage.rb'
require './lib/heroes/Thief.rb'
require './lib/heroes/Cleric.rb'



describe 'Game' do 
	it "integral test ok" do 

	knight = Hero.create(1, "knight")
	
	battlemage = Hero.create(3, "battlemage")
	
	test_turn = Game.new(battlemage, knight)
	knight.stats[:mana] = 9
	battlemage.stats[:mana] = 9
	until test_turn.end == 999 do 
	    test_turn.turn.ability_call(rand(4)+1)
	    test_turn.stats_update(knight)
	    test_turn.turn.switch_sides	
	    test_turn.turn.ability_call(rand(7)+1)
	    test_turn.stats_update(battlemage)
	    test_turn.turn.switch_sides	
	end 

	expext(test_turn.end).to eq 999 
  end 
end 

