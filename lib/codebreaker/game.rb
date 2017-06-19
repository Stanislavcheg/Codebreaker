require_relative 'generator'
require_relative 'validator'
require_relative 'matcher'
module Codebreaker
  # Describes Codebreaker game logic
  class Game
    include Generator
    include Validator
    include Matcher

    attr_reader :turns, :current_turn, :is_guessed
    def initialize
      @secret_code = ''
      @hint = ''
      @turns = 10
    end

    def start
      @is_guessed = false
      @current_turn = 0
      @secret_code = generate_code
      @hint = generate_hint
    end

    def show_hint
      @hint
    end

    def evaluate_guess(guess)
      raise "player's entry is incorrect" unless valid_guess?(guess)
      @current_turn += 1
      @is_guessed = true if guess == @secret_code
      result = check_matches(guess) if valid_turn?(current_turn, turns)
      result
    end

    private def generate_score_string(player_name)
      "#{player_name} won the game for #{current_turn} turns. The code was #{@secret_code}"
    end

    def save_score(player_name, file_name = File.dirname(__FILE__) + '/scores.txt')
      score_string = generate_score_string(player_name)
      open(file_name, 'a') { |file| file.puts score_string }
    end
  end
end
