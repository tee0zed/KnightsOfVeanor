require 'byebug'

class Game

  def initialize
    @@current_turn = 1
  end

  def self.new_turn
    @@current_turn += 1
  end

  def self.current_turn
    @@current_turn
  end


  def self.cli(player1, player2)
    print "\t   >>>>>>>>>>#{Game.current_turn} TURN<<<<<<<<<<\n\r"
    print "\n=================================================\r"
    print "#{print_stats(player1)}"
    print "\n=================================================\r"
    print "#{print_stats(player2)}"
    print "\n=================================================\r\n\n\n"
  end

  def self.print_hp(player)
    el = '#'
    el * player.hp
  end

  def self.print_mana(player)
    el = '#'
    el * player.mana
  end

  def self.print_effects(player)
    player.status.each do |stat|
      if stat[1][1].is_a? TrueClass
        print "\n#{stat[0]} lasts for #{stat[1][0]} turn(s)"
      end
    end
    print "\nDef #{player.defence} \nDmg #{player.damage} \nHit Chance #{player.hit_chance}"
  end

  def self.print_stats(player)
    print "\n#{player.hero_name}, #{player.class.name} \nHP #{print_hp(player)} \nMP #{print_mana(player)}"
    print_effects(player)
  end

  def self.hero_create
    puts "Player choose your character:"
    Hero.hero_types.each_with_index do |hero, i|
      puts "#{i + 1} - #{hero}"
    end
    choice = 0
    until choice.between?(1, Hero.hero_types.size)
      choice = STDIN.gets.chomp.to_i
    end
    puts "Name your character:"
    name = gets.chomp
    Hero.create(choice, name)
  end

  def self.ability_choise(player)
    puts "Choose ability"
    i = 1
    player.abilities.each_with_index  do |item, index|
      puts "#{index} - #{item}"
    end
    choice = 0
    until choice.between?(1, player.abilities.size)
      choice = STDIN.gets.chomp.to_i
    end
    player.abilities[choice - 1]
  end

  def self.game_end(player)
    puts "#{player.hero_name} is dead!"
  end

end

