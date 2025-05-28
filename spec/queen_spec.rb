# frozen_string_literal: true

require_relative '../lib/queen'

describe Queen do
  let(:queen) { described_class.new([3, 3]) }
  describe '#move' do
    it 'moves forward' do
      expect(queen.move([3, 7])).to be true
    end

    it 'moves backwards' do
      expect(queen.move([3, 0])).to be true
    end

    it 'moves to the left' do
      expect(queen.move([0, 3])).to be true
    end

    it 'moves to the right' do
      expect(queen.move([7, 3])).to be true
    end

    it 'moves along the top-left to bottom-right diagonal' do
      expect(queen.move([2, 4])).to be true
    end

    it 'moves along the top-right to bottom-left diagonal' do
      expect(queen.move([4, 4])).to be true
    end
  end
end
