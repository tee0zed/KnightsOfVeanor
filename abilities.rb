class Abilities


  attr_accessor :caster, :opponent

  def initialize(player1, player2)
    @caster = player1
    @opponent = player2
  end

  def switch_sides
    @caster, @opponent = @opponent, @caster
  end

  def heal
    req_mana = 6
    if @caster.has_mana?(req_mana)
      @caster.mana-=req_mana
      @caster.hp+=rand(6..10)
      hp_overload?
    else 
      Magic.ability_choice(@caster)
    end
  end

  def hp_overload?
    
    if @caster.hp > @caster.class::HP
     @caster.hp = @caster.class::HP 
     puts "HP is full!"
    end 
  end

  def attack
    if rand(@caster.hit_chance..10) > rand(1..10)
      @opponent.melee_damage_taken = @caster.damage
    else
      @opponent.melee_damage_taken = 0
    end
  end

  def defending_stance
    @caster.status[:stance][0] = 1
    @caster.status[:stance][1] = true
    @caster.defence += 5
    puts "#{@caster.hero_name} in defending stance!"
  end

  def blade_dancing
    if rand(@caster.hit_chance..10) > rand(1..10)
      if rand(2) == 1
        puts "Double strike!"
        @opponent.melee_damage_taken = @caster.damage * 2
      else
        puts "Weak strike!"
        @opponent.melee_damage_taken = @caster.damage / 2
      end
    else
     @opponent.melee_damage_taken = 0
    end
  end

  def devastating_blow
    req_mana = 5
    if @caster.has_mana?(req_mana)
      @caster.mana -= req_mana
      if rand(@caster.hit_chance..10) > rand(1..10)
        puts "Devastating blow!"
        @opponent.melee_damage_taken = @caster.damage * 1.5
      else
        @opponent.melee_damage_taken = 0
      end
    else 
      Magic.ability_choice(@caster)
    end
  end

  def damage_spell(spell)
    req_mana = spell[:mana]
    if @caster.has_mana?(req_mana)
      @caster.mana -= req_mana
      @opponent.magic_damage_taken = rand(spell[:min]..spell[:max])
    else
      Magic.ability_choice(@caster)
    end
  end

  dmg_spells = {
      fireball: {mana: 6, min: 6, max: 10},
      firestorm: {mana: 10, min: 10, max: 15},
      lightingbolt: {mana: 7, min: 8, max: 11}
  }


  def buff(buffs)
    req_mana = buffs[:mana]
    if buffs[:caster].has_mana?(req_mana)
      buffs[:caster].status[buffs[0] = 3
      buffs[:caster].status[buffs][1] = true
      buffs[:caster].mana -= req_mana
      buffs[:caster].buffs[:stat] += buffs[:value]
      buffs[:second_stat].nil?
      
      puts buffs[:text]
    else
      Magic.ability_choice(@caster)
    end
  end

  buffs = {
      shield: {spell: :shield, caster: @caster, opponent:, mana: 5, turns: 3, stat: :defence, second_stat:, value: 5
      text: "#{@caster.hero_name} doubled defence for 2 more rounds!" },
      curse: {}


  }

  def curse
    req_mana = 8
    if @caster.has_mana?(req_mana)
      @opponent.status[:curse][0] = 3
      @opponent.status[:curse][1] = true
      @caster.mana -= req_mana
      @opponent.defence -= 3
      @opponent.damage -= 3
      puts "#{@opponent.hero_name} cursed for 2 more rounds!"
    else
      Magic.ability_choice(@caster)
    end
  end

  def rage
    req_mana = 5
    if @caster.has_mana?(req_mana)
      @caster.status[:rage][0] = 2
      @caster.status[:rage][1] = true
      @caster.mana -= req_mana
      @caster.damage += 4
      puts "#{@caster.hero_name} doubled damage for 2 more rounds!"
    else
      Magic.ability_choice(@caster)
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
      Magic.ability_choice(@caster)
    end
  end

end



