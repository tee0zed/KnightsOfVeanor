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

	knight = Hero.create(1, "knight")
	
	battlemage = Hero.create(3, "battlemage")
	
	test_turn = Game.new(knight, battlemage)

	rage = test_turn.turn.buffs[:rage]

	knight.mana = 9999 

	it 'should do ok for rage' do 	

		test_turn.turn.buff(rage)

		expect(knight.status[:rage][1]).to eq true

	end

	it 'should change stats after next turn' do 

	
		
		test_turn.turn.buff(rage)

		expect(knight.stats[:damage]).to eq 11 

		test_turn.stats_update(knight) 

		expect(knight.status[:rage][1]).to eq true
		expect(knight.status[:rage][0]).to eq 2

	end 

	it 'should reset stats after buff expires' do 

		test_turn.turn.buff(rage)

		expect(knight.stats[:damage]).to eq 11 

		3.times{test_turn.stats_update(knight)}

		expect(knight.status[:rage][1]).to eq false
		expect(knight.status[:rage][0]).to eq 0
		expect(knight.stats[:damage]).to eq Knight::DAMAGE 

	end 

	it 'should renew buff when player repeats same and behave as expected'  do 

		test_turn.turn.buff(rage)

		expect(knight.stats[:damage]).to eq 11 

		2.times{test_turn.stats_update(knight)}

		expect(knight.status[:rage][1]).to eq true 
		expect(knight.status[:rage][0]).to eq 1
		expect(knight.stats[:damage]).to eq 11

		test_turn.turn.buff(test_turn.turn.buffs[:rage])

		expect(knight.status[:rage][1]).to eq true 
		expect(knight.status[:rage][0]).to eq 3
		expect(knight.stats[:damage]).to eq 11

		3.times{test_turn.stats_update(knight)}

		expect(knight.status[:rage][1]).to eq false
		expect(knight.status[:rage][0]).to eq 0
		expect(knight.stats[:damage]).to eq Knight::DAMAGE  

	end 

	it 'should do ok for rage call' do 	

		test_turn.turn.ability_call(3)

		expect(knight.status[:rage][1]).to eq true

	end

end 

