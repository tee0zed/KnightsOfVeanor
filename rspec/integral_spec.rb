require 'rspec'

require './lib/game.rb'
require './lib/scene.rb'
require './lib/hero.rb'
require './lib/heroes/Knight.rb'
require './lib/heroes/Battlemage.rb'
require './lib/heroes/Thief.rb'
require './lib/heroes/Cleric.rb'

describe 'Scene' do
  it "integral test ok" do

    knight = Hero.create(1, "knight")

    battlemage = Hero.create(3, "battlemage")

    test_game = Game.new(knight, battlemage)

    test_game.create_scene

    battlemage.stats[:mana] = 9999
    knight.stats[:mana] = 9999

    until Game.game_over? do

      test_game.scene.ability_call(rand(4) + 1)
      test_game.scene.switch_sides

      test_game.scene.ability_call(rand(7) + 1)
      test_game.scene.switch_sides

      test_game.stats_update(knight)

      test_game.stats_update(battlemage)

    end

    expect(Game.game_over?).to eq true
  end
end 

