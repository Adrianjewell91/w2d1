require 'byebug'
require_relative 'piece'
require_relative 'error'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    # byebug
    @grid.each_index do |idx|
      if [0,1,6,7].include?(idx)
        @grid[idx].map!.with_index { |pos, i| Piece.new([idx,i]) }
      end
    end
  end

  def [](pos)
    x, y = pos[0], pos[1]
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos[0], pos[1]
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise PositionError, "No piece in start position"
    elsif self[end_pos]
      raise PositionError, "End position taken"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
      self[end_pos].pos = end_pos
    end
  end


end
