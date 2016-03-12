module TicTacToe
  class Game

    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board   = board
      @current_player, @other_player = players.shuffle(random: Time.now.to_i)
    end

    def play
      puts "#{current_player.name} has been randomly selected as first player"

      loop do
        board.formatted_grid
        puts "\n#{ask_move}"
        x, y = get_move

        if board.set_cell(x, y, current_player.color)
          if board.game_over
            board.formatted_grid

            puts game_over_message

            return
          else
            switch_players!
          end
        end
      end
    end

    def switch_players!
      @current_player, @other_player = @other_player, @current_player
    end

    def ask_move
      "#{current_player.name}: Enter a number between 1 and 9 to make your move."
    end

    def get_move(human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end

    def game_over_message
      return "\n\n#{current_player.name} won!\n\n" if board.game_over == :winner
      return "\n\nThe game ended in a tie!\n\n"    if board.game_over == :draw
    end

    private

    def human_move_to_coordinate(human_move)
      mapping = {
        "1" => [0, 0],
        "2" => [1, 0],
        "3" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "7" => [0, 2],
        "8" => [1, 2],
        "9" => [2, 2],
      }

      mapping[human_move]
    end
  end
end
