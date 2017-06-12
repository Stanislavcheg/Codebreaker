require_relative 'codebreaker/version'
require_relative 'codebreaker/game'
# Codebreaker game executible file
module Codebreaker
  loop do
    game = Game.new
    game.welcome
    game.show_menu

    player_input = gets.chomp

    until player_input == 'S'
      case player_input
      when 'T'
        game.show_scores
      when 'R'
        game.show_rules
      when 'Q'
        exit
      end
      game.show_menu
      player_input = gets.chomp
    end

    game.start

    while game.current_turn < game.turns && !game.is_guessed
      puts 'Please take a guess!'
      player_input = gets.chomp

      if player_input == 'H'
        game.show_hint
      else
        begin
          game.evaluate_guess(player_input)
        rescue
          puts 'Guess should consist of four numbers between 1 and 6.'
        end
      end
    end

    if game.is_guessed
      game.win_game
      puts "Enter 'Y' to save your score. Any other key to skip"
      if gets.chomp == 'Y'
        print "Enter your name: "
        game.save_score(gets.chomp)
      end
    else
      game.lose_game
    end
  end
end
