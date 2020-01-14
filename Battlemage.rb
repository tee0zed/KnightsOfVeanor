require './hero.rb'
require './heal.rb'

class Battlemage < Hero

  include Heal

  MANA = 60
  HP = 35
  DEFENCE = 2
  DAMAGE = 3
  HIT_CHANCE = 4


  def initialize(name)
    super
  end

  def abilities
    [Magic.shield, Magic.fireball, Magic.firestorm, Magic.curse]
  end
end