require './lib/hero.rb'

class Battlemage < Hero

  MANA = 60
  HP = 35
  DEFENCE = 2
  DAMAGE = 3
  HIT_CHANCE = 4
  ABILITIES = {attack: "Attack", defending_stance: "Defending stance - +3 def for next turn", heal: "Heal - +(6-10)HP -6 MP", shield:"Shield - +5def for 2 turns -5 MP", fireball:"Fireball - (6-10)dmg -6 MP", firestorm:"Firestorm - (10-15)dmg -10 MP", curse:"Curse - -4 op's dmg, -4 op's def for 2 turns -8 MP"}

  def initialize(name)
    super
  end

end