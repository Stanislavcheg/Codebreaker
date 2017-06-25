require_relative 'version'
require_relative 'game'
require_relative 'ui'
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
