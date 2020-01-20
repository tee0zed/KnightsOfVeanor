
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
      print "\nNot enough mana!"
      false
    else
      true
    end
  end

  def melee_damage_taken=(damage)
    if damage >= @stats[:hp]
       self.game_end 
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
      self.game_end
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
    when :defending_stance
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

  def game_end
    puts "
          XX     XXXXX   XXXX   XXXXXXX  X    X 
          X  X   X      X    X     X     X    X
          X  XX  XXXXX  X    X     X     XXXXXX
          X  X   X      XXXXXX     X     X    X
          XX     XXXXX  X    X     X     X    X  

    \n\t\t#{self.hero_name.to_s.upcase} IS DEAD!"
    sleep 1 
    Game.end   
  end

end


