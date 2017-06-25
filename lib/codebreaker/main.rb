require_relative 'codebreaker/version'
require_relative 'codebreaker/game'
require_relative 'codebreaker/ui'
# Codebreaker game executible file
module Codebreaker
  loop do
    view = Ui.new

    view.welcome
    view.show_menu
    view.evaluate_menu_input
    view.gaming
    view.end_game
    view.save_score
  end
end
