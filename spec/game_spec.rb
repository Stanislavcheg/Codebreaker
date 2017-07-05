require 'spec_helper'
require './lib/codebreaker/game'
require 'data'
# Game class tests
module Codebreaker
  RSpec.describe Game do
    subject(:game) { Game.new }
    let(:player_name) { 'Test Player' }
    let(:data) { Data.algorithm_data }
    before do
      game.start
    end

    describe '#start' do
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

    describe '#evaluate_guess' do
      before do
        game.instance_variable_set(:@secret_code, '1234')
      end

      context 'when exact match' do
        it 'returns 4 "+"' do
          guess = '1234'
          expect(game.evaluate_guess(guess)).to eq("++++")
        end
      end

      context 'when no match' do
        it 'returns empty line' do
          guess = '5656'
          expect(game.evaluate_guess(guess)).to eq("")
        end
      end

      context 'when partial match' do
        context 'when correct digits are at the correct places' do
          it 'returns one "+"' do
            guess = '5255'
            expect(game.evaluate_guess(guess)).to eq("+")
          end

          it 'returns two "++"' do
            guess = '6224'
            expect(game.evaluate_guess(guess)).to eq("++")
          end
        end

        context 'when correct digits are at the wrong places' do
          it 'returns one "-"' do
            guess = '5525'
            expect(game.evaluate_guess(guess)).to eq("-")
          end

          it 'returns two "--"' do
            guess = '4525'
            expect(game.evaluate_guess(guess)).to eq("--")
          end
        end

        context 'mixed' do
          it 'returns one "+" and one "-"' do
            guess = '1525'
            expect(game.evaluate_guess(guess)).to eq("+-")
          end
        end
      end

      context 'when same digits in the secret code' do
        before do
          game.instance_variable_set(:@secret_code, '1224')
        end
        it 'returns one "+"' do
          guess = '5525'
          expect(game.evaluate_guess(guess)).to eq("+")
        end
        it 'returns one "-"' do
          guess = '5632'
          expect(game.evaluate_guess(guess)).to eq("-")
        end
        it 'returns one "+" and one "-"' do
          guess = '2525'
          expect(game.evaluate_guess(guess)).to eq("+-")
        end
      end

      context 'when same digits in the guess' do
        before do
          game.instance_variable_set(:@secret_code, '1234')
        end

        it 'returns one "+"' do
          guess = '5225'
          expect(game.evaluate_guess(guess)).to eq("+")
        end
        it 'returns one "-"' do
          guess = '5622'
          expect(game.evaluate_guess(guess)).to eq("-")
        end
      end

      it 'checks result for the match for different combinations of code/guess data' do
        data.each do |elem|
          guess, code, result = elem
          game.instance_variable_set(:@secret_code, code)
          game.instance_variable_set(:@current_turn, 1)
          expect(game.evaluate_guess(guess)).to eq(result)
        end
      end

      it 'increases number of turns when take a guess' do
        guess = '5622'
        expect { game.evaluate_guess(guess) }.to change { game.instance_variable_get(:@current_turn) }.by(1)
      end
    end

    describe '#show_hint' do
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

      describe '#generate_score_string' do
        it 'generates appropriate string' do
          expect(game.send(:generate_score_string, player_name)).to eq test_score_string
        end
      end
    end
  end
end
