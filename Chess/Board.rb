require_relative "Piece"
require "byebug"

class Board
  
  attr_accessor :grid
  
  def initialize
    @sentinel = NullPiece.instance
    @grid = Array.new(8) {Array.new(8)}
    2.upto(5) do |i|
      @grid[i].each_index do |j|
        pos = [i, j]
        self[pos] = @sentinel
      end
    end
    0.upto(1) do |i|
      @grid[i].each_index do |j|
        pos = [i, j]
        self[pos] = Piece.new
      end
    end
    6.upto(7) do |i|
      @grid[i].each_index do |j|
        pos = [i, j]
        self[pos] = Piece.new
      end
    end
  end
  
  def move_piece(start_pos, end_pos)
    
    raise "There is no piece at start position" if start_pos.is_a?(NullPiece)
    raise "There is a piece at the end position" if end_pos.is_a?(Piece)
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, value)
    # debugger
    row, col = pos
    @grid[row][col] = value
  end
  
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  puts @grid = Array.new(8) {Array.new(8)}
end

