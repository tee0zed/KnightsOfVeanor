require "./hero.rb"

class Cleric < Hero

  MANA = 50
  HP = 45
  DEFENCE = 4
  DAMAGE = 5
  HIT_CHANCE = 7
  ABILITIES = {attack: "Attack", defending_stance: "Defending stance", heal: "Heal", lightingbolt: "Lightingbolt", blessing: "Blessing"}

  def initialize(name)
    super
  end

end 