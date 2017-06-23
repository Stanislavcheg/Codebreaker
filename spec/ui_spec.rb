require 'spec_helper'
require './lib/codebreaker/ui'
# Ui class tests
module Codebreaker
  RSpec.describe Ui do
    subject(:view) { Ui.new }

    describe '#welcome' do
      it 'should display appropriate greeting' do
        expect { view.welcome }.to output(File.read(File.dirname(__FILE__) + '/welcome.txt') + "\n").to_stdout
      end
    end

    describe '#show_rules' do
      it 'should display right rules' do
        expect { view.show_rules }.to output(File.read(File.dirname(__FILE__) + '/rules.txt') + "\n").to_stdout
      end
    end

    describe '#show_menu' do
      it 'should display appropriate menu' do
        expect { view.show_menu }.to output(File.read(File.dirname(__FILE__) + '/menu.txt') + "\n").to_stdout
      end
    end

    describe '#win_game' do
      it 'displays appropriate message' do
        expect { view.send(:win_game) }.to output(File.read(File.dirname(__FILE__) + '/win_game.txt') + "\n").to_stdout
      end
    end

    describe '#lose_game' do
      it 'displays appropriate message' do
        expect { view.send(:lose_game) }.to output(File.read(File.dirname(__FILE__) + '/lose_game.txt') + "\n").to_stdout
      end
    end

    describe '#show_scores' do
      let(:file_name) { File.dirname(__FILE__) + '/../lib/codebreaker/scores.txt' }
      it 'should display scores table' do
        expect { view.show_scores }.to output(File.read(file_name)).to_stdout
      end
      it 'should display appropriate message when no scores' do
        allow(view).to receive(:open_file).and_raise('no file')
        expect { view.show_scores }.to output("No scores yet.\n").to_stdout
      end
    end

    describe '#save_score' do
      let(:test_score_string) { 'Test Player won the game for 4 turns. The code was 1234' }
      let(:file_name) { File.dirname(__FILE__) + '/scores.txt' }

      it 'saves score to the end of the file' do
        view.save_score
        saved_string = File.read(file_name).split("\n").last
        expect(saved_string).to eq test_score_string
      end
    end
  end
end
