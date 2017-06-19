require 'spec_helper'
require './lib/codebreaker/ui'
# Ui class tests
module Codebreaker
  RSpec.describe Ui do
    let(:view) { Ui.new }

    context '#welcome' do
      it 'should display appropriate greeting' do
        expect { view.welcome }.to output(File.read(File.dirname(__FILE__) + '/welcome.txt') + "\n").to_stdout
      end
    end

    context '#show_rules' do
      it 'should display right rules' do
        expect { view.show_rules }.to output(File.read(File.dirname(__FILE__) + '/rules.txt') + "\n").to_stdout
      end
    end

    context '#show_menu' do
      it 'should display appropriate menu' do
        expect { view.show_menu }.to output(File.read(File.dirname(__FILE__) + '/menu.txt') + "\n").to_stdout
      end
    end

    context '#win_game' do
      it 'displays appropriate message' do
        expect { view.win_game }.to output(File.read(File.dirname(__FILE__) + '/win_game.txt') + "\n").to_stdout
      end
    end

    context '#lose_game' do
      it 'displays appropriate message' do
        expect { view.lose_game }.to output(File.read(File.dirname(__FILE__) + '/lose_game.txt') + "\n").to_stdout
      end
    end

    context '#show_scores' do
      let(:file_name) { File.dirname(__FILE__) + '/../lib/codebreaker/scores.txt' }
      it 'should display scores table' do
        expect { view.show_scores }.to output(File.read(file_name)).to_stdout
      end
      it 'should display appropriate message when no scores' do
        allow(view).to receive(:open_file).and_raise('no file')
        expect { view.show_scores }.to output("No scores yet.\n").to_stdout
      end
    end
  end
end
