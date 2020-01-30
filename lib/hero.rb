# frozen_string_literal: true

require './lib/scene.rb'

class Hero
  def initialize(name)
    @status =
        {
            shield: [0, false],
            blessing: [0, false],
            rage: [0, false],
            curse: [0, false],
            defending_stance: [0, false]
        }
    @stats =
        {
            hp: self.class::HP,
            mana: self.class::MANA,
            defence: self.class::DEFENCE,
            damage: self.class::DAMAGE,
            hit_chance: self.class::HIT_CHANCE

        }
    @abilities = self.class::ABILITIES
    @hero_name = name
  end

  attr_accessor :status, :hero_name, :abilities, :stats

  def self.hero_types
    [Knight, Cleric, Battlemage, Thief]
  end

  def self.create(type, name)
    Hero.hero_types[type - 1].new(name)
  end

  def melee_damage_taken=(damage)
    if damage >= @stats[:hp]
      game_end
    else
      if damage > @stats[:defence]
        damage -= @stats[:defence]
        @stats[:hp] -= damage
        print "#{damage} damage dealed!"
      elsif damage.between?(1, @stats[:defence])
        print "\nAttack has been blocked!"
      elsif damage == 0
        print "\nMiss!"
      end
    end
  end

  def magic_damage_taken=(damage)
    if damage >= @stats[:hp]
      game_end
    else
      @stats[:hp] -= damage
    end
  end

  def game_end
    puts File.open('./lib/logo2', &:read)

    puts "\n\t\t#{hero_name.to_s.upcase} IS DEAD!"

    sleep 1

    Game.game_over
  end
end
