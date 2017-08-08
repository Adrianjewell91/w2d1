require 'byebug'
require_relative 'piece'
require_relative 'error'

PIECES = {
  'rook' => Rook,
  'knight' => Knight,
  'bishop' => Bishop,
  'queen' => Queen,
  'king' => King,
  'bishop2' => Bishop,
  'knight2' => Knight,
  'rook2' => Rook
}

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def populate
    @grid.each_index do |row|
      case row
      when 0
        PIECES.keys.each_with_index do |piece, idx|
          @grid[row][idx] = PIECES[piece].new([row,idx] , :black)
        end
      when 1
        @grid[row].map!.with_index { |pos, i| Pawn.new([row,i], :black) }
      when 6
        @grid[row].map!.with_index { |pos, i| Pawn.new([row,i], :white) }
      when 7
        PIECES.keys.each_with_index do |piece, idx|
          @grid[row][idx] = PIECES[piece].new([row,idx] , :white)
        end
      else
        @grid[row].map!{ |pos| NullPiece.instance }
      end
    end
  end

  # if [0,1,6,7].include?(row)
  #   @grid[row].map!.with_index { |pos, i| Piece.new([row,i]) }

  def [](pos)
    x, y = pos[0], pos[1]
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos[0], pos[1]
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == NullPiece.instance
      raise PositionError, "No piece in start position"
    elsif self[end_pos].color == self[start_pos].color
      raise PositionError, "End position friendly"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
      self[end_pos].pos = end_pos
    end
  end

end
