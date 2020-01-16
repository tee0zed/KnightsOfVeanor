
class Game

  def initialize
    @player1 = Game.hero_create
    @player2 = Game.hero_create
    @current_turn = 0
    @turn = Abilities.new(@player1, @player2)
  end

  def new_turn
    @player1.new_turn
    @player2.new_turn
    self.cli 
    @current_turn += 1 
    puts "#{@player1.hero_name} turn!"
    ability_choise(@player1)
    self.cli
    @turn.switch_sides
    puts "#{@player2.hero_name} turn!"
    ability_choise(@player2)
  end

  def current_turn
    @current_turn
  end


  def cli
    puts "\t   >>>>>>>>>>#{self.current_turn} TURN<<<<<<<<<<\n\r"
    puts "\n=======================================================\r"
    puts "#{print_stats(@player1)}"
    puts "\n=======================================================\r"
    puts "#{print_stats(@player2)}"
    puts "\n=======================================================\r\n\n\n"
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

  def ability_choise(player)
    puts "Choose ability"
    i = 1
    player.abilities.each  do |key, value|
      puts "#{i} - #{value}"
      i += 1 
    end
    choice = 0
    until choice.between?(1, player.abilities.size)
      puts "Input must be between 1 and #{player.abilities.size}"
      choice = STDIN.gets.chomp.to_i
    end
    byebug
    @turn.method(@player1.abilities.keys[choice-1]).call
  end

  def self.game_end
    byebug
    puts "XX    XXXXX   XXXX   XXXXXXX  X    X 
          X  X  X      X    X     X     X    X
          X  XX XXXXX  X    X     X     XXXXXX
          X  X  X      XXXXXX     X     X    X
          XX    XXXXX  X    X     X     X    X  

    \t\t#{@player1.hero_name} is dead!"
    sleep 1 
    eval("break")  
  end

end

