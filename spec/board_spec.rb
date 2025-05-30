# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }
  let(:pawn) { instance_double(Pawn) }

  before do
    allow(pawn).to receive(:move).and_return(true)
    board.instance_variable_get(:@board)[5][0] = pawn
  end

  it 'calls the move function of a piece' do
    expect(pawn).to receive(:move).with([4, 0])
    board.move([5, 0], [4, 0], :black)
  end
end
