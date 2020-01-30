# frozen_string_literal: true

require './lib/hero.rb'

class Thief < Hero
  MANA = 30
  HP = 40
  DEFENCE = 4
  DAMAGE = 8
  HIT_CHANCE = 9
  ABILITIES = {attack: 'Attack', defending_stance: 'Defending stance - +3 def for next turn', blade_dancing: 'Blade Dancing - 50% doubled damage chance, otherwise - half damage will be dealed', curse: "Curse - -4 op's dmg, -4 op's def for 2 turns -8 MP"}.freeze

  def initialize(name)
    super
  end
end
