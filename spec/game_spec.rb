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
          expect(game.evaluate_guess(guess)).to eq("++++")
        end
      end

      context 'when no match' do
        it do
          guess = '5656'
          expect(game.evaluate_guess(guess)).to eq("")
        end
      end

      context 'when partial match' do
        context 'when correct digits are at the correct places' do
          it do
            guess = '5255'
            expect(game.evaluate_guess(guess)).to eq("+")
          end

          it do
            guess = '6224'
            expect(game.evaluate_guess(guess)).to eq("++")
          end
        end

        context 'when correct digits are at the wrong places' do
          it do
            guess = '5525'
            expect(game.evaluate_guess(guess)).to eq("-")
          end

          it do
            guess = '4525'
            expect(game.evaluate_guess(guess)).to eq("--")
          end
        end

        context 'mixed' do
          it do
            guess = '1525'
            expect(game.evaluate_guess(guess)).to eq("+-")
          end
        end
      end

      context 'when same digits in the secret code' do
        before do
          game.instance_variable_set(:@secret_code, '1224')
        end
        it do
          guess = '5525'
          expect(game.evaluate_guess(guess)).to eq("+")
        end
        it do
          guess = '5632'
          expect(game.evaluate_guess(guess)).to eq("-")
        end
        it do
          guess = '2525'
          expect(game.evaluate_guess(guess)).to eq("+-")
        end
      end

      context 'when same digits in the guess' do
        before do
          game.instance_variable_set(:@secret_code, '1234')
        end

        it do
          guess = '5225'
          expect(game.evaluate_guess(guess)).to eq("+")
        end
        it do
          guess = '5622'
          expect(game.evaluate_guess(guess)).to eq("-")
        end
      end

      it 'increases number of turns when take a guess' do
        guess = '5622'
        expect { game.evaluate_guess(guess) }.to change { game.instance_variable_get(:@current_turn) }.by(1)
      end
    end

    context '#show_hint' do
      it { expect(game.instance_variable_get(:@hint)).not_to be_nil }
      it 'should be a digit of the secret code' do
        code_digits = game.instance_variable_get(:@secret_code).chars
        expect(code_digits).to include game.instance_variable_get(:@hint)
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
  end
end
