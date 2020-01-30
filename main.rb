# frozen_string_literal: true

require './lib/heroes/Cleric.rb'
require './lib/heroes/Battlemage.rb'
require './lib/heroes/Knight.rb'
require './lib/heroes/Thief.rb'
require './lib/scene.rb'
require './lib/game.rb'

puts File.open('./lib/logo', &:read)

sleep 1

Game.clear

game = Game.new

game.hero_create 

game.create_scene

game.game_start
