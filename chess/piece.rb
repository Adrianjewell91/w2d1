require_relative 'piece_modules'

class Piece
  attr_accessor :pos

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def moves(pos)
  end

end


class NullPiece < Piece
  def initialize; end

  include Singleton
end


class Bishop< Piece
  include SlidingPiece

  def move_dirs
    [:diagonal]
  end

end

class Rook < Piece
  include SlidingPiece

  def move_dirs
    [:horizontal, :vertical]
  end

end

class Queen < Piece
  include SlidingPiece
  include SteppingPiece

  def move_dirs
    [:horizontal, :vertical, :diagonal]
  end
end
