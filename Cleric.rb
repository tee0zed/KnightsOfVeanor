require "./hero.rb"
require "./heal.rb"

class Cleric < Hero 

  include Heal

  MANA = 40
  HP = 40
  DEFENCE = 4
  DAMAGE = 5
  HIT_CHANCE = 7

  def initialize(name)
  super
  end 

end 