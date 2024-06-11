# frozen_string_literal: true

# Programme entry point

require './mastermind'

game = Mastermind.new

puts "Do you want to play or should the computer ply instead? (Type 'play' or 'computer')"
choice = gets.chomp.downcase
if choice == 'play'
  game.play
elsif choice == 'computer'
  game.computer_play
else
  puts 'Invalid choice'
end
