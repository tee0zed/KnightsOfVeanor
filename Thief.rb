require './hero.rb'

class Thief < Hero

  MANA = 30
  HP = 40
  DEFENCE = 4
  DAMAGE = 8
  HIT_CHANCE = 9
  ABILITIES = {attack: "Attack", defending_stance: "Defending stance", blade_dancing: "Blade Dancing - 50% double damage chance, otherwise - half damage will be dealed"}
  
  def initialize(name)
    super
  end

end
