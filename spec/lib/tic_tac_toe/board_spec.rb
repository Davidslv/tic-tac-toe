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

    describe '#get_cell' do
      it 'returns the cell value based on (x, y) coordinates' do
        grid = [["", "" , ""],["", "" , "O"],["", "" , ""]]
        board = Board.new(grid: grid)

        expect( board.get_cell(2,1) ).to eq("O")
      end
    end

    describe '#set_cell' do
      it 'sets the cell value based on (x, y) coordinates' do
        board = Board.new
        board.set_cell(1, 1, "X")

        expect(board.get_cell(1, 1).value).to eql("X")
      end
    end

    describe '#game_over' do
      let(:board) { Board.new }

      it 'returns :winner when winner? is true' do
        board.stub(:winner?) { true }

        expect(board.game_over).to eq :winner
      end

      it 'returns :draw when draw? is true' do
        board.stub(:winner?) { false }
        board.stub(:draw?) { true }

        expect(board.game_over).to eq :draw
      end

      it 'returns false if winner? and draw? are false' do
        board.stub(:winner?) { false }
        board.stub(:draw?) { false }

        expect(board.game_over).to be_falsey
      end
    end
  end
end
