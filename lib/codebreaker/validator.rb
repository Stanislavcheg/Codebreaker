module Codebreaker
  # Validator for player's guess
  module Validator
    def valid_guess?(guess, code_length = 4)
      !guess.match(/^[1-6]{#{code_length}}$/).nil?
    end

    def valid_turn?(current_turn, turns)
      current_turn <= turns
    end
  end
end
