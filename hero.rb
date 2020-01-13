
class Hero

  def initialize(name)

    @status =
        {
            shield: [0, false],
            blessing: [0, false],
            rage: [0, false],
            curse:[0, false],
            stance: [0, false]
        }
    @hp = self.class::HP
    @mana = self.class::MANA
    @defence = self.class::DEFENCE
    @damage = self.class::DAMAGE
    @hit_chance = self.class::HIT_CHANCE

 
    @hero_name = name 

  end

  attr_accessor :hp, :mana, :defence, :damage, :status, :hero_name


  def self.hero_types
    [Knight, Cleric, Battlemage, Thief]
  end 

  def self.create(type, name)
   return Hero.hero_types[type-1].new(name)
  end 

  def attack
    if rand(@hit_chance..10) > rand(1..10)
      @damage
    else
      0
    end
  end

  def defending_stance
    req_mana = 2
    if self.has_mana?(req_mana)
      self.status[:stance][0] = 1
      self.status[:stance][1] = true
      self.mana-=req_mana
      self.defence+=5
      puts "#{self.hero_name} in defending stance!"
    else
      Game.player_turn(self)
    end
  end

  def has_mana?(req_mana)
    if req_mana > @mana
      puts "Not enough mana!"
      false
    else
      true
    end
  end

  def melee_damage_taken=(damage)
    if damage>=@hp
      Game.game_end(self)
    else
      if damage>@defence
        damage-=@defence
        @hp-=damage
      elsif damage.between?(1, @defence)
        puts "Attack has been blocked!"
      elsif damage == 0
        puts "Miss!"
      end
    end
  end

  def magic_damage_taken=(damage)
    if damage>=@hp
      Game.game_end(self)
    else
      @hp-=damage
    end
  end

  def new_turn
    self.status.each do |key|
      if key[0].zero?
        self.status_check(key)
      else
        key[0]-=1
      end
    end
  end

  def status_check(key)
    key[1].is_a? TrueClass  
    self.set_default_stats(key)
  end

  def set_default_stats(key)
      self.stats[key][1] = false 
      case key 
    when :stance 
      self.defence-=5    
    when :shield
      self.defence-=5
    when :curse 
      self.defence*=2 
      self.damage+=3
    when :rage 
      self.damage-=4
    when :blessing 
      self.defence/=1.5 
      self.damage/=1.5
    end 
  end 

