require "./hero.rb"

class Knight < Hero

  MANA = 15
  HP = 50
  DEFENCE = 5
  DAMAGE = 6
  HIT_CHANCE = 8
  ABILITIES = {attack: "Attack", defending_stance: "Defending stance", rage:"Rage", devastating_blow:"Devastating blow"}

  def initialize(name)
    super
  end

end
