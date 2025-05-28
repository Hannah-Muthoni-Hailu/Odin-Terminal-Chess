# frozen_string_literal: true

require_relative '../lib/king'

describe King do
  let(:king) { described_class.new([1, 1], :black) }
  describe '#move' do
    it 'allows the king to move one step in any direction' do
      expect(king.move([0, 0])).to be true
    end

    it 'updates the location' do
      new_loc = [0, 0]
      king.move(new_loc)
      expect(king.instance_variable_get(:@location)).to eq(new_loc)
    end

    it 'does not allow the king to move more than one step from its original location' do
      expect(king.move([1, 3])).to be false
    end
  end
end
