# frozen_string_literal: true

require_relative '../lib/bishop'

describe Bishop do
  let(:bishop) { described_class.new([3, 3], :black) }
  describe '#move' do
    it 'moves across the top-right to bottom-left diagonal' do
      expect(bishop.move([4, 4])).to be true
    end

    it 'moves across the top-left to bottom-right diagonal' do
      expect(bishop.move([2, 4])).to be true
    end

    it 'updates the location value' do
      new_loc = [4, 4]
      bishop.move(new_loc)
      expect(bishop.instance_variable_get(:@location)).to eq(new_loc)
    end

    it 'yields the locations as it steps through' do
      new_location = [[2, 4], [1, 5]]
      bishop.move([1, 5]) { |loc, ind| expect(loc).to eq(new_location[ind]) }
    end
  end
end
