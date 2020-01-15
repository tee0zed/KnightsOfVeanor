require './hero.rb'

class Battlemage < Hero

  MANA = 60
  HP = 35
  DEFENCE = 2
  DAMAGE = 3
  HIT_CHANCE = 4
  ABILITIES = {attack: "Attack", defending_stance: "Defending stance", heal: "Heal", shield:"Shield", fireball:"Fireball", firestorm:"Firestorm", curse:"Curse"}

  def initialize(name)
    super
  end

end