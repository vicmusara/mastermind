# frozen_string_literal: true

# Main game class plus game logic

require './code_generator'
require './feedback'
require './player'

class Mastermind
  def initialize
    @code_generator = CodeGenerator.new
    @feedback = Feedback.new
    @max_attempts = 12
  end

  def play
    @secret_code = @code_generator.generate_code
    player = Player.new

    puts 'Welcome to Mastermind!'
    puts 'Try to guess the 4-digit code. Each digit is between 1 and 6'
    puts "You have 12 attempts. Let's begin!"

    @max_attempts.times do |attempt|
      puts "Attempt #{attempt + 1}: Enter your guess:"
      guess = player.take_guess

      if guess == @secret_code
        puts "Congratulations! You've guessed the code correctly."
        return
      else
        @feedback.give_feedback(guess, @secret_code)
      end
    end

    puts "Sorry, you've run out of attempts. The secret code was #{@secret_code.join}"
  end

  def computer_play
    player = Player.new
    @secret_code = player.take_user_code

    @max_attempts.times do |attempt|
      guess = @code_generator.generate_code
      puts "Computer's attempt #{attempt + 1}: #{guess.join}"

      if guess == @secret_code
        puts 'The computer guess your code correctly.'
        return
      else
        @feedback.give_feedback(guess, @secret_code)
      end
    end

    puts 'The computer failed to guess your code in 12 attempts'
  end
end
