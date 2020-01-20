require "byebug"
class Abilities


  attr_accessor :caster, :opponent

  def initialize(player1, player2)
    @caster = player1
    @opponent = player2
  end


  def switch_sides
    @caster, @opponent = @opponent, @caster
  end

  def stats_update
    @caster.status.each do |key, value|
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

    @caster.status[key][1] = false

    spell = buffs[key]  
    
    @caster.stats[spell[:stat]] -= spell[:value]
      
      unless spell[:second_stat].nil?
        @caster.stats[spell[:second_stat]] -= spell[:second_value]
      end

  end

  def ability_choice 

    puts "Choose ability"

    i = 1

    @caster.abilities.each  do |key, value|
      puts "#{i} - #{value}"
      i += 1 
    end

    puts "\n\n"

    choice = 0

    until choice.between?(1, @caster.abilities.size)
      puts "Input must be between 1 and #{@caster.abilities.size}"
      choice = STDIN.gets.chomp.to_i
    end

    ability = @caster.abilities.keys[choice-1]
    
    if buffs.keys.include?(ability) 

      if @caster.status[ability][1].is_a?(FalseClass)

        buff(buffs[ability])

      else
        self.ability_choice
      end

    elsif spells.keys.include?(ability) 

      cast_spell(spells[ability])

    else

    method(ability).call
    
    end

  end


  def heal

    req_mana = 6

    if @caster.has_mana?(req_mana)
      @caster.stats[:mana] -= req_mana
      @caster.stats[:hp] += rand(6..10)
      
    else 
      self.ability_choice
    end

  end


  def hp_overload?

    if @caster.stats[:hp] > @caster.class::HP
     @caster.stats[:hp] = @caster.class::HP
     puts "HP is full!"
    end

  end


  def attack

    if rand(10) < rand(@caster.stats[:hit_chance]..10)
      @opponent.melee_damage_taken = @caster.stats[:damage]
      
    else
      @opponent.melee_damage_taken = 0
    end

  end


  def blade_dancing

    if rand(@caster.stats[:hit_chance]..10) > rand(1..10)

      if rand(2) == 1
        puts "Double strike!"
        @opponent.melee_damage_taken = @caster.stats[:damage] * 2
      else
        puts "Weak strike!"
        @opponent.melee_damage_taken = @caster.stats[:damage] / 2
      end
    
    else
     @opponent.melee_damage_taken = 0
    end

  end
  

  def cast_spell(spell)

    req_mana = spell[:mana]

    if @caster.has_mana?(req_mana)
    
      @caster.stats[:mana] -= req_mana

      damage = rand(spell[:min]..spell[:max])

      spell[:target].magic_damage_taken = damage

      self.hp_overload?

      puts "#{damage} #{spell[:text]} with #{spell[:spell]}"
    else
      self.ability_choice
    end
  
  end


  def buff(buffs)
    req_mana = buffs[:mana]
    if @caster.has_mana?(req_mana)

      buffs[:target].status[buffs[:spell]][0] = buffs[:turns]

      buffs[:target].status[buffs[:spell]][1] = true
      
      @caster.stats[:mana] -= req_mana

      buffs[:target].stats[buffs[:stat]] += buffs[:value]

      unless buffs[:second_stat].nil?
        buffs[:target].stats[buffs[:second_stat]] += buffs[:second_value]
      end

      puts "#{@caster.hero_name} #{buffs[:text]}"
    else
      self.ability_choice
    end
  end

  def spells 
  {
      heal: {spell: "Heal", target: @caster, mana: 6, min: -10, max: -6, text: "HP restored"},
      devastating_blow: {spell: "Devastating blow", target: @opponent, mana: 5, min: 10, max: 12, text: "damage dealed"},
      fireball: {spell: "Fireball", target: @opponent, mana: 6, min: 6, max: 10, text: "damage dealed"},
      firestorm: {spell:"Fire storm", target: @opponent, mana: 10, min: 10, max: 15, text: "damage dealed"},
      lightingbolt: {spell: "Lighting bolt", target: @opponent, mana: 7, min: 8, max: 11, text: "damage dealed"}
  }
  end 


  def buffs 
  {  
      defending_stance: {spell: :defending_stance, target: @caster, mana: 0, turns: 1, stat: :defence, second_stat: nil, value: 3, second_value: nil, 
        text: "is in Defending stance!" }, 
      shield: {spell: :shield, target: @caster, mana: 5, turns: 3, stat: :defence, second_stat: nil, value: 5, second_value: nil,
        text: "Increased defence for 2 more rounds!" },
      curse: {spell: :curse, target: @opponent, mana: 8, turns: 3, stat: :defence, second_stat: :damage, value: -3, second_value: -3,
        text: "Opponent cursed for 2 more rounds!" }, 
      rage: {spell: :rage, target: @caster, mana: 5, turns: 3, stat: :damage, second_stat: nil, value: 4, second_value: nil,
        text: "Increased damage for 2 more rounds!" },
      blessing: {spell: :blessing, target: @caster, mana: 8, turns: 3, stat: :defence, second_stat: :damage, value: 4, second_value: 4,
        text: "Blessed for 2 more rounds!" }
  }
  end 

end 


