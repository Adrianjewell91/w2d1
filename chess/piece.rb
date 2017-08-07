class Piece
  attr_accessor :pos
  
  def initialize(pos)
    @pos = pos
  end

end

class NullPiece < Piece
  def initialize; end
end
