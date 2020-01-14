require './hero.rb'
require './heal.rb'

class Thief < Hero

  MANA = 30
  HP = 40
  DEFENCE = 4
  DAMAGE = 8
  HIT_CHANCE = 9


  def initialize(name)
    super
  end

  def abilities
    [Magic.blade_dancing]
  end
end
