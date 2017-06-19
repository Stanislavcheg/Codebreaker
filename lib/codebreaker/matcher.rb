module Codebreaker
  # Checks guess for matches
  module Matcher
    def check_matches(guess)
      result = ''
      matches = count_number_matches(guess)
      exact_matches = count_exact_matches(guess)
      exact_matches.times do
        result += '+'
      end
      (matches - exact_matches).times do
        result += '-'
      end
      result
    end

    private def count_number_matches(guess)
      count = 0
      guess_copy = String.new(guess)
      @secret_code.chars.each do |number|
        if guess_copy.include?(number)
          index = guess_copy.index(number)
          guess_copy[index] = ''
          count += 1
        end
      end
      count
    end

    private def count_exact_matches(guess)
      count = 0
      @secret_code.chars.size.times do |index|
        count += 1 if @secret_code[index] == guess[index]
      end
      count
    end
  end
end
