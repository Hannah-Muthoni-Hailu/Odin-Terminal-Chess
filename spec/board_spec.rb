# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/pawn'

describe Board do
  subject(:board) { described_class.new }
  let(:pawn) { Pawn.new([5, 0], :black) }
  let(:rook) { Rook.new([2, 0], :black) }

  context 'when eating' do
    before do
      allow(pawn).to receive(:move).and_return(true)
      board.instance_variable_get(:@board)[5][0] = pawn
      board.instance_variable_get(:@board)[6][0] = ' '
      board.instance_variable_get(:@board)[2][0] = rook
      board.instance_variable_get(:@board)[2][1] = '0'
    end

    it 'calls the move function of a piece' do
      expect(pawn).to receive(:move).with([6, 0])
      board.play([5, 0], [6, 0])
    end

    it 'stops player from moving over another piece' do
      expect(board.play([2, 0], [2, 2])).to eq('Invalid move!')
    end
  end

  context 'when eating' do
    before do
      board.instance_variable_get(:@board)[5][0] = pawn
      board.instance_variable_get(:@board)[2][0] = rook
      board.instance_variable_get(:@board)[2][1] = '0'
      board.instance_variable_get(:@board)[6][1] = '0'
    end

    it 'calls the eat function of a pawn' do
      expect(pawn).to receive(:eat).with([6, 1])
      board.play([5, 0], [6, 1])
    end

    it 'calls the move function of any other piece' do
      expect(rook).to receive(:move).with([2, 1])
      board.play([2, 0], [2, 1])
    end

    it 'removes the target value' do
      board.play([2, 0], [2, 1])
      expect(board.instance_variable_get(:@board)[2][1]).to eq rook
    end
  end
end
