require 'spec_helper'

module TicTacToe
  describe Board do
    describe '#initialize' do
      it 'initializes the board' do
        expect { Board.new(grid: "board") }.to_not raise_error
      end

      it 'has 3 rows by default' do
        board = Board.new
        expect(board.grid.size).to eq(3)
      end

      it 'has 3 cells in each row by default' do
        board = Board.new

        board.grid.each do |row|
          expect(row.size).to eql(3)
        end
      end
    end

    describe '#grid' do
      it 'returns the grid' do
        board = Board.new(grid: 'blah')
        expect(board.grid).to eq('blah')
      end
    end
  end
end
