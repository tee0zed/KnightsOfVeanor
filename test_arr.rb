require "byebug"

abilities = [1, 2, 3]

abilities.each_with_index do |abl, i| 
    puts "#{i+1} - #{abl}" 
    end
    choice = 0 
    until choice.between?(1, abilities.size) 
    choice = STDIN.gets.chomp.to_i
    end 
    