require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  attr_accessor :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  # def render_loop
  #   render
  #   while true
  #     @cursor.get_input # results in user entered position
  #     system("clear")
  #     render
  #   end
  # end

  def render
    puts "   #{(0..7).to_a.join('   ')}"
    (0..7).each do |row|
      puts "#{row} #{print_row(@board.grid[row] , row).join('|')}"
      puts
    end
  end

  private

  def print_row(row, row_idx)
    # debugger
    row.map.with_index do |el, col_idx|
      if el != NullPiece.instance
        if @cursor.cursor_pos == [row_idx, col_idx]
          " #{@board[[row_idx,col_idx]].icon} ".colorize(:background => :light_blue)
        else
          " #{@board[[row_idx,col_idx]].icon} ".colorize(:background => :light_green)
        end
      else
        if @cursor.cursor_pos == [row_idx, col_idx]
          '   '.colorize(:background => :light_blue)
        else
          '   '.colorize(:background => :light_green)
        end
      end
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate

  d = Display.new(board)
  d.render_loop

end
