require_relative 'codebreaker/version'
require_relative 'codebreaker/game'
require_relative 'codebreaker/ui'
# Codebreaker game executible file
module Codebreaker
  loop do
    game = Game.new
    view = Ui.new

    view.welcome
    view.show_menu
    view.evaluate_menu_input

    game.start

    while game.current_turn < game.turns && !game.is_guessed
      view.ask_to_guess
      view.read_input

      if view.asked_for_hint?
        view.print_hint game.show_hint
        next
      end

      begin
        view.print_result game.evaluate_guess(view.player_input)
      rescue
        view.incorrect_input_warning
      end

    end

    view.end_game(game.is_guessed)
    game.save_score(view.player_name) if view.player_name
  end
end
