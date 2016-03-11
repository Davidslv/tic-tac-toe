require 'spec_helper'

module TicTacToe
  describe Player do
    describe '#initialize' do

      context 'when initialized without name and color' do
        it 'raises an exception' do
          expect { Player.new }.to raise_error(ArgumentError)
        end
      end

      it 'initializes with a name and a color' do
        player = Player.new(name: 'david', color: 'red')
        expect(player.name).to eq('david')
        expect(player.color).to eq('red')
      end
    end
  end
end
