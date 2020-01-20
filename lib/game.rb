
class Game

  attr_accessor :turn, :player1, :player2, :end 

  def initialize

    @player1 = Game.hero_create
    @player2 = Game.hero_create
    
    @current_turn = 0
    
    @turn = Abilities.new(@player1, @player2)
    
    @@end = 0
  end

  def game_start  

    loop do 

      @current_turn += 1

      break if @@end == 999 
      
      new_turn(player1)
      
      break if @@end == 999
      
      new_turn(player2)

    end

  end

  def new_turn(player)
      
    Game.clear
    self.cli

    puts "#{player.hero_name} turn!"
    @turn.ability_choice

    sleep 1

    @turn.switch_sides


    player.stats_update
  
  end 

  def current_turn
    @current_turn
  end


  def cli
    print "\t   >>>>>>>>>>#{self.current_turn} TURN<<<<<<<<<<\n\r"
    print "\n=======================================================\r"
    print "#{print_stats(@player1)}\r"
    print "\n=======================================================\r"
    print "#{print_stats(@player2)}\r"
    print "\n=======================================================\n\n\n\n\r"
  end

  def print_hp(player)
    el = '#'
    el * player.stats[:hp]
  end

  def print_mana(player)
    el = '#'
    el * player.stats[:mana]
  end

  def print_effects(player)
    player.status.each do |stat|
      if stat[1][1].is_a?(TrueClass)
        print "\n#{stat[0]} lasts for #{stat[1][0]} turn(s)"
      end
    end
    print "\nDef #{player.stats[:defence]} \nDmg #{player.stats[:damage]} \nHit Chance #{player.stats[:hit_chance]}"
  end

  def print_stats(player)
    print "\n#{player.hero_name}, #{player.class.name} \nHP #{print_hp(player)} \nMP #{print_mana(player)}"
    print_effects(player)
  end

  def self.hero_create
    puts "Player choose your character:\r"
    Hero.hero_types.each_with_index do |hero, i|
      puts "#{i + 1} - #{hero}"
    end
    choice = 0
    until choice.between?(1, Hero.hero_types.size)
      choice = STDIN.gets.chomp.to_i
    end
    puts "Name your character:"
    name = STDIN.gets.chomp
    Hero.create(choice, name)
  end

  def self.end 
    @@end = 999 
  end 
  
  def self.clear 
    print "





















































    \r" 
  end 

end


