module Codebreaker
  # Describes Codebreaker game logic
  class Game
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

    private def generate_code(length = 4, range = 1..6)
      code = ''
      length.times do
        rand_number = rand range
        code += rand_number.to_s
      end
      code
    end

    private def generate_hint
      rand_number = rand 0...@secret_code.length
      @secret_code[rand_number]
    end

    def show_hint
      puts @hint
    end

    def evaluate_guess(guess)
      unless guess.size == @secret_code.size && guess.match(/[1-6]{#{@secret_code.size}}/)
        raise "player's entry is incorrect"
      end
      @current_turn += 1
      @is_guessed = true if guess == @secret_code
      result = check_matches(guess) if current_turn <= turns
      puts result
    end

    private def check_matches(guess)
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

    def welcome
      open_file_and_puts 'welcome.txt'
    end

    def show_rules
      open_file_and_puts 'rules.txt'
    end

    def show_menu
      open_file_and_puts 'menu.txt'
    end

    def win_game
      open_file_and_puts 'win_game.txt'
    end

    def lose_game
      open_file_and_puts 'lose_game.txt'
    end

    def show_scores
      begin
        open_file_and_puts 'scores.txt'
      rescue
        puts 'No scores yet.'
      end
    end

    private def open_file_and_puts(file_name)
      File.open(File.dirname(__FILE__) + "/#{file_name}", "r") do |file|
        file.each_line do |line|
          print line
        end
      end
      puts
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
