require_relative 'piece_modules'
require 'singleton'

class Piece
  attr_accessor :pos

  def initialize(pos)
    @pos = pos
  end

  def moves(pos)
  end

end


class NullPiece < Piece
  include Singleton

  def initialize; end

end


class Bishop < Piece
  include SlidingPiece

  @@icon = {black: '♝', white: '♗'}

  def initialize(pos, color)
    @icon = @@icon[color]
    super(pos)
  end

  def move_dirs
    [:diagonal]
  end

end

class Rook < Piece
  include SlidingPiece

  @@icon = {black: '♜', white: '♖'}

  def initialize(pos, color)
    @icon = @@icon[color]
    super(pos)
  end

  def move_dirs
    [:horizontal, :vertical]
  end

end

class Queen < Piece
  include SlidingPiece
  include SteppingPiece

  @@icon = {black: '♛', white: '♕'}

  def initialize(pos, color)
    @icon = @@icon[color]
    super(pos)
  end

  def move_dirs
    [:horizontal, :vertical, :diagonal]
  end
end

class King < Piece
  include SteppingPiece

  @@icon = {black: '♚', white: '♔'}

  def initialize(pos, color)
    @icon = @@icon[color]
    super(pos)
  end

  def move_dirs
    [:horizontal, :vertical, :diagonal]
  end
end

class Knight < Piece
  include SteppingPiece

  @@icon = {black: '♞', white: '♘'}

  def initialize(pos, color)
    @icon = @@icon[color]
    super(pos)
  end

  def move_dirs
    [:horizontal, :vertical] # 'L' shape?
  end
end

class Pawn < Piece
  include SteppingPiece

  @@icon = {black: '♟', white: '♙'}

  def initialize(pos, color)
    @icon = @@icon[color]
    super(pos)
  end

  def move_dirs
    [:vertical, :diagonal]
  end
end
