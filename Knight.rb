require "./hero.rb"
require "./heal.rb"

class Knight < Hero

  MANA = 15
  HP = 50
  DEFENCE = 5
  DAMAGE = 8
  HIT_CHANCE = 8


  def initialize(name)
    super
  end

  def abilities
    [Magic.devastating_blow, Magic.rage]
  end
end
