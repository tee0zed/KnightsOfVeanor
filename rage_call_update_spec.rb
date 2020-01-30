require 'rspec'

require './lib/game.rb'
require './lib/scene.rb'
require './lib/hero.rb'
require './lib/heroes/Knight.rb'
require './lib/heroes/Battlemage.rb'
require './lib/heroes/Thief.rb'
require './lib/heroes/Cleric.rb'



describe 'Scene' do 

	knight = Hero.create(1, "knight")
	
	battlemage = Hero.create(3, "battlemage")
	
	test_game = Game.new(knight, battlemage)

	test_game.create_scene 

	rage = test_game.scene.buffs[:rage]

	knight.stats[:mana] = 9999 

	it 'should do ok for rage' do 	

		test_game.scene.buff(rage)

		expect(knight.status[:rage][1]).to eq true

	end

	it 'should change stats after next turn' do 

	
		
		test_game.scene.buff(rage)

		expect(knight.stats[:damage]).to eq 11 

		test_game.stats_update(knight) 

		expect(knight.status[:rage][1]).to eq true
		expect(knight.status[:rage][0]).to eq 2

	end 

	it 'should reset stats after rage expires' do 

		test_game.scene.buff(rage)

		expect(knight.stats[:damage]).to eq 11 

		3.times{test_game.stats_update(knight)}

		expect(knight.status[:rage][1]).to eq false
		expect(knight.status[:rage][0]).to eq 0
		expect(knight.stats[:damage]).to eq Knight::DAMAGE 

	end 

	it 'should renew rage when player recall it'  do 

		test_game.scene.buff(rage)

		expect(knight.stats[:damage]).to eq 11 

		2.times{test_game.stats_update(knight)}

		expect(knight.status[:rage][1]).to eq true 
		expect(knight.status[:rage][0]).to eq 1
		expect(knight.stats[:damage]).to eq 11

		test_game.scene.buff(test_game.scene.buffs[:rage])

		expect(knight.status[:rage][1]).to eq true 
		expect(knight.status[:rage][0]).to eq 3
		expect(knight.stats[:damage]).to eq 11

		3.times{test_game.stats_update(knight)}

		expect(knight.status[:rage][1]).to eq false
		expect(knight.status[:rage][0]).to eq 0
		expect(knight.stats[:damage]).to eq Knight::DAMAGE  

	end 

	it 'should do ok for rage call' do 	

		test_game.scene.ability_call(3)

		expect(knight.status[:rage][1]).to eq true

	end

end 

