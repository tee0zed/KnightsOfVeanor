class Game

  def initialize(player1, player2)
    turn = Magic.new(player1, player2)
    @@current_turn = 1
  end

  def self.new_turn
    @@current_turn+=1
  end

  def self.current_turn
    @@current_turn
  end


  def cli(player1, player2)
    print "
 ___________________________________________________________________________
|                                                                           |
|                     #{Game.current_turn}  Turn                            |
|#{print_stats(player1)}              #{print_stats(player2)}               |
|                                                                           |
|                                                                           |
|                                                                           |
|                                                                           |
|                                                                           |
|                                                                           |
|                                                                           |
|                                                                           |
|                                                                           |
|                                                                           |
|                                                                           |
|___________________________________________________________________________|

\r"
  end

  def self.print_bar(player, points)
    el = '#'
    print "#{el*player.points}"
  end 

  def self.print_effects(player)
    player.status.each do |stat|
      stat[1].is_a? TrueClass 
      print "\n#{stat} lasts for #{stat[0]} turn(s)"
    end 
    print "\nDef #{player.defence} \nDmg #{player.damage} \nHit_Chance #{player.hit_chance}"
  end

  def self.print_stats(player)
    print "\n#{player.hero_name}, #{player.class.name} \n#{HP} #{bar(player, hp)} \n#{MP} #{bar(player, mana)}"  
    print_effects(player)
  end 

  def self.hero_create
      puts "Player choose your character!"
    Hero.hero_types.each_with_index do |hero, i|
      puts "#{i+1} - #{hero}"
    end 
    choice = 0 
    until choice.between?(1, Hero.hero_types.size)
      choice = STDIN.gets.chomp.to_i
    end
    puts "Name your character!"
    name = gets.chomp 
    return Hero.create(choice, name)
  end 

  def display_abilities_and_get_choice(player) 
    puts "Choose action"
    player.abilities.each_with_index do |abl, i| 
    puts "#{i+1} - #{abl}" 
    end
    choice = 0 
    until choice.between?(1, player.abilities.size) 
    choice = STDIN.gets.chomp.to_i
    end 
    player.abilities[choice-1]  
  end 

  def self.game_end(player)
    puts "#{player.hero_name} is dead!"
    break 
  end

end


