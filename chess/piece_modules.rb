require 'byebug'

module SlidingPiece
# debugger
  def moves(board) #gets direction from class.
    possible_moves = []
      move_dirs.each do |direction|
        if direction == :vertical
          current_pos = @pos.dup
          possible_moves << current_pos.dup
          current_pos[0] += 1
          while true
            case valid_test_move(current_pos,board)
            when :same_color, :off_grid
              break
            when :diff_color
              possible_moves << current_pos.dup
              break
            else
              possible_moves << current_pos.dup
              current_pos[0] += 1
            end
          end

          current_pos = @pos.dup
          current_pos[0] -= 1
          while true
            case valid_test_move(current_pos,board)
            when :same_color, :off_grid
              break
            when :diff_color
              possible_moves << current_pos.dup
              break
            else
              possible_moves << current_pos.dup
              current_pos[0] -= 1
            end
          end
        end
      end
      possible_moves
    end

  def valid_test_move(current_pos, board)
    if current_pos[0] < 0 || current_pos[0] > 7
      :off_grid
    elsif board[current_pos] == NullPiece.instance
      nil
    elsif board[current_pos].color == board[@pos].color
      :same_color
    else
      :diff_color
    end
  end

end




module SteppingPiece

end







# move_dirs.each do |direction|
#   if direction == :horizontal
#     current_pos = @pos
#     until #current pos not valid
#       possible_moves << current_pos
#       current_pos[0] += 1
#     end
#     current_pos = @pos
#     until #current pos not valid
#       possible_moves << current_pos
#       current_pos[0] -= 1
#     end
#   end
# end
