# frozen_string_literal: true

require './lib/hero.rb'

class Cleric < Hero
  MANA = 50
  HP = 45
  DEFENCE = 4
  DAMAGE = 6
  HIT_CHANCE = 7
  ABILITIES = {attack: 'Attack', defending_stance: 'Defending stance - +3 def for next turn', heal: 'Heal - +(6-10)HP -6 MP', lightingbolt: 'Lightingbolt - (8-11)dmg -7 MP', blessing: 'Blessing - +4dmg +4def for 2 turns -8 MP'}.freeze

  def initialize(name)
    super
  end
end
