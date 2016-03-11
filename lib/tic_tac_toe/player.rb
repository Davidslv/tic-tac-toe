module TicTacToe
  class Player

    attr_reader :color, :name

    def initialize(color:, name:)
      @color, @name = color, name
    end
  end
end
