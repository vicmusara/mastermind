# frozen_string_literal: true

class Feedback
  def give_feedback(guess, secret_code)
    exact_matches = 0
    partial_matches = 0

    guess.each_with_index do |digit, index|
      if digit == secret_code[index]
        exact_matches += 1
      elsif secret_code.include?(digit)
        partial_matches += 1
      end
    end

    puts "Exact matches: #{exact_matches}"
    puts "Partial matches: #{partial_matches}"
  end
end
