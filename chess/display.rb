require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render_loop
    render
    while true
      @cursor.get_input
      system("clear")
      render
    end
  end

  def render
    puts "   #{(0..7).to_a.join('   ')}"
    (0..7).each do |row|
      puts "#{row} #{print_row(@board.grid[row] , row).join('|')}"
      puts
    end
  end

  private

  def print_row(row, row_idx)
    row.map.with_index do |el, col_idx|
      if @cursor.cursor_pos == [row_idx, col_idx]
        " #{@board[[row_idx,col_idx]].icon} ".colorize(:background => :light_blue)
      elsif el
        " #{@board[[row_idx,col_idx]].icon} ".colorize(:background => :light_green)
      else
        '   '.colorize(:background => :light_green)
      end
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  d = Display.new(Board.new)
  d.render_loop

end
