
class Game

  attr_accessor :turn, :player1, :player2 

  def initialize
    @player1 = Game.hero_create
    @player2 = Game.hero_create
    @current_turn = 0
    @turn = Abilities.new(@player1, @player2)
  end

  def new_turn
    @player1.stats_update
    @player2.stats_update
    self.cli
    puts "#{@player1.hero_name} turn!"
    @turn.ability_choice
    @turn.switch_sides
    self.cli
    puts "#{@player2.hero_name} turn!"
    @turn.ability_choice
    @current_turn += 1 
  end

  def current_turn
    @current_turn
  end


  def cli
    system "clear"
    print "\t   >>>>>>>>>>#{self.current_turn} TURN<<<<<<<<<<\n\r"
    print "\n=======================================================\r"
    print "#{print_stats(@player1)}\r"
    print "\n=======================================================\r"
    print "#{print_stats(@player2)}\r"
    print "\n=======================================================\n\n\n\n\r"
  end

  def print_hp(player)
    el = '#'
    el * player.hp
  end

  def print_mana(player)
    el = '#'
    el * player.mana
  end

  def print_effects(player)
    player.status.each do |stat|
      if stat[1][1].is_a? TrueClass
        print "\n#{stat[0]} lasts for #{stat[1][0]} turn(s)"
      end
    end
    print "\nDef #{player.defence} \nDmg #{player.damage} \nHit Chance #{player.hit_chance}"
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

  def self.game_end
    byebug
    puts "XX     XXXXX   XXXX   XXXXXXX  X    X 
          X  X   X      X    X     X     X    X
          X  XX  XXXXX  X    X     X     XXXXXX
          X  X   X      XXXXXX     X     X    X
          XX     XXXXX  X    X     X     X    X  

    \t\t#{@turn.opponent.hero_name} is dead!"
    sleep 1 
    eval("break")  
  end

end

