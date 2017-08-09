require_relative 'display.rb'
require_relative 'board.rb'


class Game

  def initialize(board = Board.new)
    @board = board
    @display = Display.new(board)
  end

  def setup
    @board.populate

  end

  def play
    take_turn until won?
  end

  def take_turn
    start_end = [nil, nil].map { |el| render_loop }
    @board.move_piece(start_end[0], start_end[1])
  rescue PositionError
    # @display.render
  end

  def render_loop
    @display.render
    while true
      next_pos = @display.cursor.get_input # results in user entered position
      system("clear")
      break if next_pos
      @display.render
    end
    next_pos
  end

  def won?
    false
  end

end


# if __FILE__ == $PROGRAM_NAME
#
#   game = Game.new
#   game.setup
#   game
#   # move rook to [5,5], call #moves on rook -- should result in array of moves
#
# end
