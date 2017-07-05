module Codebreaker
  # Checks guess for matches
  module Matcher
    def check_matches(guess)
      matches = count_number_matches(guess)
      exact_matches = count_exact_matches(guess)
      '+' * exact_matches + '-' * (matches - exact_matches)
    end

    private

    def count_number_matches(guess)
      count = 0
      guess_copy = guess.clone
      @secret_code.chars.each do |number|
        next unless guess_copy.include?(number)
        index = guess_copy.index(number)
        guess_copy[index] = ''
        count += 1
      end
      count
    end

    def count_exact_matches(guess)
      @secret_code.chars.zip(guess.chars).select { |elem| elem[0] == elem[1] }.count
    end
  end
end
