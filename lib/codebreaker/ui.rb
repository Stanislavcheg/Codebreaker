module Codebreaker
  # Describes Codebreaker Ui logic
  class Ui
    attr_reader :player_input, :player_name
    def initialize
      @player_input = ''
    end

    def welcome
      puts "Welcome to the Codebreaker game! It's a logic game in which a code-breaker tries to break a secret code of four numbers between 1 and 6."
    end

    def show_rules
      open_file 'rules.txt'
    end

    def show_menu
      open_file 'menu.txt'
    end

    def win_game
      puts 'Congratulations!!! You guessed the code.'
    end

    def lose_game
      puts "Game over. You didn't guess the code. :("
    end

    def show_scores
      begin
        open_file 'scores.txt'
      rescue
        puts 'No scores yet.'
      end
    end

    def incorrect_input_warning
      puts 'Guess should consist of four numbers between 1 and 6.'
    end

    private def open_file(file_name)
      File.open(File.dirname(__FILE__) + "/#{file_name}", "r") do |file|
        file.each_line do |line|
          puts line
        end
      end
    end

    def read_input
      @player_input = gets.chomp
    end

    def evaluate_menu_input
      until read_input == 'S'
        case player_input
        when 'T'
          show_scores
        when 'R'
          show_rules
        when 'Q'
          exit
        end
        show_menu
      end
    end

    private def want_save_score?
      puts "Enter 'Y' to save your score. Any other key to skip"
      read_input == 'Y'
    end

    private def ask_name
      print 'Please enter your name: '
      @player_name = read_input
    end

    def ask_to_guess
      puts 'Please take a guess!'
    end

    def print_result(result)
      puts "your matches are: #{result}"
    end

    def print_hint(hint)
      puts "The hint: #{hint}"
    end

    def asked_for_hint?
      player_input == 'H'
    end

    def end_game(is_guessed)
      if is_guessed
        win_game
        ask_name if want_save_score?
      else
        lose_game
      end
    end
  end
end
