require './hero.rb'
require './heal.rb'

class Battlemage < Hero

  include Heal

  MANA = 60
  HP = 30
  DEFENCE = 1
  DAMAGE = 3
  HIT_CHANCE = 4

  def initialize(name)
  super
  end

end