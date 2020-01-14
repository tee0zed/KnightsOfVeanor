class Magic

  attr_accessor :caster, :opponent

  def initialize(player1, player2)
    @caster = player1
    @opponent = player2
  end

  def self.new_turn
    @caster, @opponent = @opponent, @caster
  end

  def magic
    [self.blade_dancing, self.devastating_blow, self.fireball,
     firestorm: self.firestorm,lightingbolt: self.lightingbolt,shield: self.shield, curse: self.curse,rage: self.rage, blessing: self.blessing}
  end

  def blade_dancing
    if rand(@caster.hit_chance..10) > rand(1..10)
      if rand(2) == 1
        puts "Double strike!"
        return @caster.damage * 2
      else
        puts "Weak strike!"
        return @caster.damage / 2
      end
    else
      0
    end
  end

  def devastating_blow
    req_mana = 5
    if @caster.has_mana?(req_mana)
      @caster.mana -= req_mana
      if rand(@caster.hit_chance..10) > rand(1..10)
        puts "Devastating blow!"
        @caster.damage * 1.5
      else
        0
      end
    end
  end


  def fireball
    req_mana = 6
    if @caster.has_mana?(req_mana)
      @caster.mana -= req_mana
      rand(6..10)
    else
      Game.player_turn(@caster)
    end
  end

  def firestorm
    req_mana = 10
    if @caster.has_mana?(req_mana)
      @caster.mana -= req_mana
      rand(10..15)
    else
      Game.player_turn(@caster)
    end
  end

  def lightingbolt
    req_mana = 7
    if @caster.has_mana?(req_mana)
      @caster.mana -= req_mana
      rand(8..11)
    else
      Game.player_turn(@caster)
    end
  end

  def shield
    req_mana = 5
    if @caster.has_mana?(req_mana)
      @caster.status[:shield][0] = 3
      @caster.status[:shield][1] = true
      @caster.mana -= req_mana
      @caster.defence += 5
      puts "#{@caster.hero_name} doubled defence for 2 more rounds!"
    else
      Game.player_turn(@caster)
    end
  end

  def curse
    req_mana = 8
    if @caster.has_mana?(req_mana)
      @caster.status[:curse][0] = 3
      @caster.status[:curse][1] = false
      @caster.mana -= req_mana
      @opponent.defence -= 3
      @opponent.damage -= 3
      puts "#{@opponent.hero_name} cursed for 2 more rounds!"
    else
      Game.player_turn(@caster)
    end
  end

  def rage
    req_mana = 5
    if @caster.has_mana?(req_mana)
      @caster.status[:rage][0] = 2
      @caster.status[:rage][1] = false
      @caster.mana -= req_mana
      @caster.damage += 4
      puts "#{@caster.hero_name} doubled damage for 2 more rounds!"
    else
      Game.player_turn(@caster)
    end
  end

  def blessing
    req_mana = 8
    if @caster.has_mana?(req_mana)
      @caster.status[:blessing][0] = 2
      @caster.status[:blessing][1] = true
      @caster.mana -= req_mana
      @caster.damage += 3
      @caster.defence += 3
      puts "#{@caster.hero_name} blessed for 2 more rounds!"
    else
      Game.player_turn(@caster)
    end
  end

end



