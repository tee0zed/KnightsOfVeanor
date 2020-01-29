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
	
	test_turn = Game.new(battlemage, knight)


	it 'should do ok for curse' do 	

		curse = test_turn.turn.buffs[:curse]

		test_turn.turn.buff(curse)

		expect(knight.status[:curse][1]).to eq true

	end

	it 'should change stats after next turn' do 
		
		curse = test_turn.turn.buffs[:curse]

		test_turn.turn.buff(curse)

		expect(knight.stats[:damage]).to eq 3 
		expect(knight.stats[:defence]).to eq 1 

		test_turn.stats_update(knight) 

		expect(knight.status[:curse][1]).to eq true
		expect(knight.status[:curse][0]).to eq 2

	end 

	it 'should reset stats after buff expires' do 
		
		curse = test_turn.turn.buffs[:curse]

		test_turn.turn.buff(curse)

		expect(knight.stats[:damage]).to eq 3

		3.times{test_turn.stats_update(knight)}

		expect(knight.status[:curse][1]).to eq false
		expect(knight.status[:curse][0]).to eq 0
		expect(knight.stats[:damage]).to eq Knight::DAMAGE 

	end 

	it 'should renew buff when player repeats same and behave as expected'  do 

		curse = test_turn.turn.buffs[:curse]
		
		test_turn.turn.buff(curse)

		expect(knight.stats[:damage]).to eq 3 

		2.times{test_turn.stats_update(knight)}

		expect(knight.status[:curse][1]).to eq true 
		expect(knight.status[:curse][0]).to eq 1
		expect(knight.stats[:damage]).to eq 3

		test_turn.turn.buff(curse)

		expect(knight.status[:curse][1]).to eq true 
		expect(knight.status[:curse][0]).to eq 3
		expect(knight.stats[:damage]).to eq 3

		3.times{test_turn.stats_update(knight)}

		expect(knight.status[:curse][1]).to eq false
		expect(knight.status[:curse][0]).to eq 0
		expect(knight.stats[:damage]).to eq Knight::DAMAGE  

	end 

	it 'should do ok for curse call' do 	

		curse = test_turn.turn.buffs[:curse]

		test_turn.turn.ability_call(7)

		expect(knight.status[:curse][1]).to eq true

	end

end 

