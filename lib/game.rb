# frozen_string_literal: true

class Game
  attr_accessor :scene, :player1, :player2, :end

  def initialize(player1 = nil, player2 = nil)
    @player1 = player1
    @player2 = player2

    @current_turn = 0

    @@game_over = false

    @scene = nil 
  end

  def game_start
    loop do 
      @current_turn += 1

      break if Game.game_over?

      new_turn(@player1)

      break if Game.game_over?

      new_turn(@player2)

      stats_update(player1)
      stats_update(player2)
    end
  end

  def create_scene
    @scene = Scene.new(@player1, @player2)
  end 

  def new_turn(player)
    
    Game.clear
    
    cli
    
    puts "#{player.hero_name} turn!"

    @scene.ability_call(@scene.ability_choice)

    sleep 1

    @scene.switch_sides
  end


  def cli
    print "\t   >>>>>>>>>>#{@current_turn} TURN<<<<<<<<<<\n\r"
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
      if stat[1][1]
        print "\n#{stat[0]} lasts for #{stat[1][0]} turn(s)"
      end
    end
    print "\nDef #{player.stats[:defence]} \nDmg #{player.stats[:damage]} \nHit Chance #{player.stats[:hit_chance]}"
  end

  def print_stats(player)
    print "\n#{player.hero_name}, #{player.class.name} \nHP #{print_hp(player)} \nMP #{print_mana(player)}"
    print_effects(player)
  end

  def hero_create
    puts "Player1 choose your character:\r"

    Hero.hero_types.each_with_index do |hero, i|
      puts "#{i + 1} - #{hero}"
    end

    choice = 0
    
    until choice.between?(1, Hero.hero_types.size)
      choice = STDIN.gets.chomp.to_i
    end

    puts ' Player1 name your character:'
    
    name1 = STDIN.gets.chomp

    puts "Player2 choose your character:\r"

    choice2 = 0

    until choice2.between?(1, Hero.hero_types.size) && choice2 != choice
      puts "\n#{Hero.hero_types[choice-1]} - Unaviable"
      choice2 = STDIN.gets.chomp.to_i
    end

    puts 'Player2 name your character:'
    name2 = STDIN.gets.chomp

   @player1 = Hero.create(choice, name1)
   @player2 = Hero.create(choice2, name2)
  end

  def stats_update(player)
    player.status.each do |key, value|
      unless value[0].zero?
        value[0] -= 1

        if value[0].zero? 
        
          value[1] = false 

          spell = @scene.buffs[key]

          player.stats[spell[:stat]] -= spell[:value]

          unless spell[:second_stat].nil?
            player.stats[spell[:second_stat]] -= spell[:second_value]
          end
        end 
      end
    end
  end

  def self.game_over
    @@game_over = true 
  end

  def self.game_over?
    @@game_over
  end 

  def self.clear
    system "cls"
    system "clear"
  end
end