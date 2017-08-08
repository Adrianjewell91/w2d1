require_relative 'display.rb'
require_relative 'board.rb'


class Game

  def initialize(board = Board.new)
    @board = board
    @display = Display.new(board)
  end

  def setup
    @board.populate
    @display.render
  end

  def play
    take_turn until won?
  end

  def take_turn
    start_end = [nil, nil].map { |el| render_loop }
    @board.move_piece(start_end[0], start_end[1])
    @display.render
  end

  def render_loop
    @display.render
    while true
      next_pos = @display.cursor.get_input # results in user entered position
      break if next_pos
      system("clear")
      @display.render
    end
    next_pos
  end

  def won?
    false
  end

end


if __FILE__ == $PROGRAM_NAME

  game = Game.new
  game.setup
  game.play

end
