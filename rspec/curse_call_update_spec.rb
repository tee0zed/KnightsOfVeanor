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

  test_game.scene.switch_sides

  curse = test_game.scene.buffs[:curse]

  battlemage.stats[:mana] = 9999

  it 'should do ok for curse' do

    test_game.scene.buff(curse)

    expect(knight.status[:curse][1]).to eq true

  end

  it 'should change stats after next turn' do

    test_game.scene.buff(curse)

    expect(knight.stats[:damage]).to eq 3
    expect(knight.stats[:defence]).to eq 1

    test_game.stats_update(knight)

    expect(knight.status[:curse][1]).to eq true
    expect(knight.status[:curse][0]).to eq 2

  end

  it 'should reset stats after curse expires' do

    test_game.scene.buff(curse)

    expect(knight.stats[:damage]).to eq 3

    3.times { test_game.stats_update(knight) }

    expect(knight.status[:curse][1]).to eq false
    expect(knight.status[:curse][0]).to eq 0
    expect(knight.stats[:damage]).to eq Knight::DAMAGE

  end

  it 'should renew curse when player recall it' do

    test_game.scene.buff(curse)

    expect(knight.stats[:damage]).to eq 3

    2.times { test_game.stats_update(knight) }

    expect(knight.status[:curse][1]).to eq true
    expect(knight.status[:curse][0]).to eq 1
    expect(knight.stats[:damage]).to eq 3

    test_game.scene.buff(curse)

    expect(knight.status[:curse][1]).to eq true
    expect(knight.status[:curse][0]).to eq 3
    expect(knight.stats[:damage]).to eq 3

    3.times { test_game.stats_update(knight) }

    expect(knight.status[:curse][1]).to eq false
    expect(knight.status[:curse][0]).to eq 0
    expect(knight.stats[:damage]).to eq Knight::DAMAGE

  end

  it 'should do ok for curse call' do

    test_game.scene.ability_call(7)

    expect(knight.status[:curse][1]).to eq true

  end

end 

