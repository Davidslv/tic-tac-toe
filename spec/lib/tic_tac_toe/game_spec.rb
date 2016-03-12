require 'spec_helper'

module TicTacToe
  describe Game do
    let(:david) { Player.new(color: "X", name: 'David') }
    let(:ale)   { Player.new(color: "O", name: 'Ale') }

    context '#initialize' do
      it 'randomly selects a current_player and other player' do
        Array.any_instance.stub(:shuffle) { [david, ale] }
        game = Game.new([david, ale])

        expect(game.current_player).to eq david
        expect(game.other_player).to eq ale
      end
    end

    context '#switch_players!' do
      it 'will set @current_player to @other_player' do
        game = Game.new([david, ale])
        other_player = game.other_player

        game.switch_players!

        expect(game.current_player).to eq other_player
      end
    end

    context '#ask_move' do
      it 'asks the player to make a move' do
        game = Game.new([david, ale])
        game.stub(:current_player) { david }
        expected = "David: Enter a number between 1 and 9 to make your move."

        expect(game.ask_move).to eq(expected)
      end
    end

    context '#get_move' do
      it 'convers human move of "1" to [0, 0]' do
        game = Game.new([david, ale])
        expect(game.get_move("1")).to eq([0,0])
      end

      it 'convers human move of "7" to [0, 2]' do
        game = Game.new([david, ale])
        expect(game.get_move("7")).to eq([0,2])
      end
    end

    context '#game_over_message' do
      it 'returns "{current player name} won!" when the board has a winner' do
        game = Game.new([david, ale])
        game.stub(:current_player) { david }
        game.board.stub(:game_over) { :winner }

        expect(game.game_over_message).to eq "David won!"
      end

      it 'returns "The game ended in a tie!" when the board has a draw' do
        game = Game.new([david, ale])
        game.stub(:current_player) { david }
        game.board.stub(:game_over) { :draw }

        expect(game.game_over_message).to eq "The game ended in a tie!"
      end
    end
  end
end
