# frozen_string_literal: true

# This will handle the user input
class Player
  def take_guess
    gets.chomp.split('').map(&:to_i)
  end

  def take_user_code
    puts 'Enter a 4-digit code for the computer to guess (each digit should be between 1 and 6):'
    gets.chomp.split('').map(&:to_i)
  end
end
