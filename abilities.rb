require 'byebug'


class Abilities


  attr_accessor :caster, :opponent

  def initialize(player1, player2)
    @caster = player1
    @opponent = player2

  end


  def switch_sides
    @caster, @opponent = @opponent, @caster
  end


  def ability_choice 
    puts "Choose ability"

    i = 1

    @caster.abilities.each  do |key, value|
      puts "#{i} - #{value}"
      i += 1 
    end

    choice = 0

    until choice.between?(1, @caster.abilities.size)
      puts "Input must be between 1 and #{@caster.abilities.size}"
      choice = STDIN.gets.chomp.to_i
    end
    ability = @caster.abilities.keys[choice-1] 

  magic = case ability 
          when :rage, :blessing, :curse, :shield
          buff(buffs[ability]) 
          when :fireball, :firestorm, :lightingbolt
          damage_spell(dmg_spells[ability])
          else
          method(ability).call 
          end 
          magic      
  end


  def heal
    req_mana = 6

    if @caster.has_mana?(req_mana)
      @caster.mana -= req_mana
      @caster.hp += rand(6..10)
      hp_overload?
    else 
      self.ability_choice
    end

  end


  def hp_overload?
    
    if @caster.hp > @caster.class::HP
     @caster.hp = @caster.class::HP 
     puts "HP is full!"
    end 

  end


  def attack

    if rand(10) < rand(@caster.hit_chance..10)
      @opponent.melee_damage_taken = @caster.damage
      
    else
      @opponent.melee_damage_taken = 0
    end

  end

  def defending_stance

    @caster.status[:stance][0] = 1
    
    @caster.status[:stance][1] = true
    
    @caster.defence += 3
    
    puts "#{@caster.hero_name} is in defending stance!"
  
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
        @turn.opponent.melee_damage_taken = @turn.caster.damage * 1.5
      else
        @turn.opponent.melee_damage_taken = 0
      end
    
    else 
      self.ability_choice
    end
  end


  def damage_spell(spell)
    req_mana = spell[:mana]

    if @caster.has_mana?(req_mana)
    
      @caster.mana -= req_mana

      puts " "

      @opponent.magic_damage_taken = rand(spell[:min]..spell[:max])
    
    else
      self.ability_choice
    end
  end


  def dmg_spells 
  {
      fireball: {mana: 6, min: 6, max: 10},
      firestorm: {mana: 10, min: 10, max: 15},
      lightingbolt: {mana: 7, min: 8, max: 11}
  }
  end 


  def buffs 
  {
      shield: {spell: :shield, target: caster, mana: 5, turns: 3, stat: caster.defence, second_stat: nil, value: 5, second_value: nil,
      text: "doubled defence for 2 more rounds!" },
      curse: {spell: :curse, target: opponent, mana: 8, turns: 3, stat: opponent.defence, second_stat: opponent.damage, value: -3, second_value: -3,
      text: "cursed opponent for 2 more rounds!" }, 
      rage: {spell: :rage, target: caster, mana: 5, turns: 2, stat: caster.damage, second_stat: nil, value: 4, second_value: nil, 
      text: "doubled damage for 2 more rounds!" },
      blessing: {spell: :blessing, target: caster, mana: 8, turns: 2, stat: caster.defence, second_stat: caster.damage, value: 4, second_value: 4, 
        text: "blessed for 2 more rounds!" }
      
  }
  end 


  def buff(buffs)
    req_mana = buffs[:mana]

    if @caster.has_mana?(req_mana)

      buffs[:target].status[buffs[:spell]][0] = buffs[:turns]

      buffs[:target].status[buffs[:spell]][1] = true
      
      @caster.mana -= req_mana
      
      buffs[:stat] += buffs[:value]

      if !buffs[:second_stat].nil?
        buffs[:second_stat] += buffs[:second_value]
      end 

      puts "#{@caster.hero_name} #{buffs[:text]}"
    else
      self.ability_choice
    end
  end

end



