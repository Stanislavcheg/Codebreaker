require 'spec_helper'
require './lib/codebreaker/game'
# Game class tests
module Codebreaker
  RSpec.describe Game do
    let(:game) { Game.new }
    let(:player_name) { 'Test Player' }
    before do
      game.start
    end

    context '#start' do
      it 'saves secret code' do
        expect(game.instance_variable_get(:@secret_code)).not_to be_empty
      end
      it 'saves 4 numbers secret code' do
        expect(game.instance_variable_get(:@secret_code).size).to eq 4
      end
      it 'saves secret code with numbers from 1 to 6' do
        expect(game.instance_variable_get(:@secret_code)).to match(/[1-6]+/)
      end
    end

    context '#evaluate_guess' do
      before do
        game.instance_variable_set(:@secret_code, '1234')
      end

      context 'when exact match' do
        it do
          guess = '1234'
          expect { game.evaluate_guess(guess) }.to output("++++\n").to_stdout
        end
      end

      context 'when no match' do
        it do
          guess = '5656'
          expect { game.evaluate_guess(guess) }.to output("\n").to_stdout
        end
      end

      context 'when partial match' do
        context 'when correct digits are at the correct places' do
          it do
            guess = '5255'
            expect { game.evaluate_guess(guess) }.to output("+\n").to_stdout
          end

          it do
            guess = '6224'
            expect { game.evaluate_guess(guess) }.to output("++\n").to_stdout
          end
        end

        context 'when correct digits are at the wrong places' do
          it do
            guess = '5525'
            expect { game.evaluate_guess(guess) }.to output("-\n").to_stdout
          end

          it do
            guess = '4525'
            expect { game.evaluate_guess(guess) }.to output("--\n").to_stdout
          end
        end

        context 'mixed' do
          it do
            guess = '1525'
            expect { game.evaluate_guess(guess) }.to output("+-\n").to_stdout
          end
        end
      end

      context 'when same digits in the secret code' do
        before do
          game.instance_variable_set(:@secret_code, '1224')
        end
        it do
          guess = '5525'
          expect { game.evaluate_guess(guess) }.to output("+\n").to_stdout
        end
        it do
          guess = '5632'
          expect { game.evaluate_guess(guess) }.to output("-\n").to_stdout
        end
        it do
          guess = '2525'
          expect { game.evaluate_guess(guess) }.to output("+-\n").to_stdout
        end
      end

      context 'when same digits in the guess' do
        before do
          game.instance_variable_set(:@secret_code, '1234')
        end

        it do
          guess = '5225'
          expect { game.evaluate_guess(guess) }.to output("+\n").to_stdout
        end
        it do
          guess = '5622'
          expect { game.evaluate_guess(guess) }.to output("-\n").to_stdout
        end
      end

      it 'increases number of turns when take a guess' do
        guess = '5622'
        expect { game.evaluate_guess(guess) }.to change { game.instance_variable_get(:@current_turn) }.by(1)
      end
    end

    context '#welcome' do
      it 'should display appropriate greeting' do
        expect { game.welcome }.to output(File.read(File.dirname(__FILE__) + '/welcome.txt') + "\n").to_stdout
      end
    end

    context '#show_rules' do
      it 'should display right rules' do
        expect { game.show_rules }.to output(File.read(File.dirname(__FILE__) + '/rules.txt') + "\n").to_stdout
      end
    end

    context '#show_menu' do
      it 'should display appropriate menu' do
        expect { game.show_menu }.to output(File.read(File.dirname(__FILE__) + '/menu.txt') + "\n").to_stdout
      end
    end

    context '#win_game' do
      it 'displays appropriate message' do
        expect { game.win_game }.to output(File.read(File.dirname(__FILE__) + '/win_game.txt') + "\n").to_stdout
      end
    end

    context '#lose_game' do
      it 'displays appropriate message' do
        expect { game.lose_game }.to output(File.read(File.dirname(__FILE__) + '/lose_game.txt') + "\n").to_stdout
      end
    end

    context '#show_hint' do
      it { expect(game.instance_variable_get(:@hint)).not_to be_nil }
      it 'should be a digit of the secret code' do
        code_digits = game.instance_variable_get(:@secret_code).chars
        expect(code_digits).to include game.instance_variable_get(:@hint)
      end
      it 'should display hint to console' do
        expect { game.show_hint }.to output(game.instance_variable_get(:@hint)+ "\n").to_stdout
      end
    end

    context 'when save score' do
      let(:test_score_string) { 'Test Player won the game for 4 turns. The code was 1234' }
      before do
        game.instance_variable_set(:@current_turn, 4)
        game.instance_variable_set(:@secret_code, '1234')
      end

      context '#generate_score_string' do
        it 'generates appropriate string' do
          expect(game.send(:generate_score_string, player_name)).to eq test_score_string
        end
      end

      context '#save_score' do
        let(:file_name) { File.dirname(__FILE__) + '/scores.txt' }

        it 'saves score to the end of the file' do
          game.save_score(player_name)
          saved_string = File.read(file_name).split("\n").last
          expect(saved_string).to eq test_score_string
        end
      end
    end

    context '#show_scores' do
      let(:file_name) { File.dirname(__FILE__) + '/../lib/codebreaker/scores.txt' }
      it 'should display scores table' do
        expect { game.show_scores }.to output(File.read(file_name) + "\n").to_stdout
      end
      it 'should display appropriate message when no scores' do
        allow(game).to receive(:open_file_and_puts).and_raise('no file')
        expect { game.show_scores }.to output("No scores yet.\n").to_stdout
      end
    end
  end
end
