class Hero

  def initialize(name)

    @status =
        {
            shield: [0, false],
            blessing: [0, false],
            rage: [0, false],
            curse: [0, false],
            stance: [0, false]
        }
    @stats =
        {
    hp: self.class::HP,
    mana: self.class::MANA,
    defence: self.class::DEFENCE,
    damage:  self.class::DAMAGE,
    hit_chance:  self.class::HIT_CHANCE,

       }
    @abilities = self.class::ABILITIES
    @hero_name = name

  end

  attr_accessor :status, :hero_name, :abilities, :stats


  def self.hero_types
    [Knight, Cleric, Battlemage, Thief]
  end

  def self.create(type, name)
    return Hero.hero_types[type - 1].new(name)
  end

  def has_mana?(req_mana)
    if req_mana > @stats[:mana]
      print "Not enough mana!"
      false
    else
      true
    end
  end

  def melee_damage_taken=(damage)
    if damage >= @stats[:hp]
       Game.game_end 
    else
      if damage > @stats[:defence]
        damage -= @stats[:defence]
        @stats[:hp] -= damage
      elsif damage.between?(1, @stats[:defence])
        print "Attack has been blocked!\n\n\n\n\n"
      elsif damage == 0
        print "Miss!\n\n\n\n\n"
      end
    end
  end

  def magic_damage_taken=(damage)
    if damage >= @stats[:hp]
      Game.game_end
    else
      @stats[:hp] -= damage
    end
  end

  def stats_update
    self.status.each do |key, value|
      if value[0].zero?
        self.status_check(key,value)
      else
        value[0] -= 1
      end
    end
  end

  def status_check(key,value)
    if value[1].is_a?(TrueClass)
    self.set_default_stats(key, value)
    end 
  end

  def set_default_stats(key, value)
    self.status[key][1] = false
    case key
    when :stance
      self.stats[:defence] -= 3
    when :shield
      self.stats[:defence] -= 5
    when :curse
      self.stats[:defence] += 3
      self.stats[:damage] += 3
    when :rage
      self.stats[:damage] -= 4
    when :blessing
      self.stats[:defence] -= 4
      self.stats[:damage] -= 4
    end
  end

end


