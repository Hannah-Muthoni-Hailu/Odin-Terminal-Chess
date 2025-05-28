# frozen_string_literal: true

require_relative '../lib/rook'

describe Rook do
  let(:rook) { described_class.new([3, 3], :black) }
  describe '#move' do
    it 'moves forward' do
      expect(rook.move([3, 5])).to be true
    end

    it 'moves backwards' do
      expect(rook.move([3, 1])).to be true
    end

    it 'moves left' do
      expect(rook.move([0, 3])).to be true
    end

    it 'moves right' do
      expect(rook.move([6, 3])).to be true
    end

    it 'updates the rook\'s location' do
      new_loc = [6, 3]
      rook.move(new_loc)
      expect(rook.instance_variable_get(:@location)).to eq(new_loc)
    end

    it 'prevents diagonal moves' do
      expect(rook.move([4, 4])).to be false
    end
  end
end
