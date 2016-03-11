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
  end
end
