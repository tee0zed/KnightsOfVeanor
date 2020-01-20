require './lib/hero.rb'

class Knight < Hero

  MANA = 15
  HP = 50
  DEFENCE = 5
  DAMAGE = 7
  HIT_CHANCE = 8
  ABILITIES = {attack: "Attack", defending_stance: "Defending stance - +3 def for next turn", rage:"Rage - +4 dmg for 2 turns", devastating_blow:"Devastating blow - (10-12)dmg -5 MP"}

  def initialize(name)
    super
  end

end
