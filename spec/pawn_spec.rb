# frozen_string_literal: true

require_relative '../lib/pawn'

describe Pawn do # rubocop:disable Metrics/BlockLength
  let(:pawn) { described_class.new([1, 0], :black) }
  describe '#move' do # rubocop:disable Metrics/BlockLength
    context 'when a valid location is given' do
      it 'allows the player to move one step forward' do
        expect(pawn.move([1, 1])).to be true
      end

      it 'changes the pawns location' do
        pawn.move([1, 1])
        expect(pawn.instance_variable_get(:@location)).to eq([1, 1])
      end

      it 'updates no_of_moves' do
        pawn.move([1, 1])
        expect(pawn.instance_variable_get(:@no_of_moves)).to eq(1)
      end
    end

    context 'when an invalid move is made' do
      before do
        pawn.instance_variable_set(:@no_of_moves, 1)
      end
      it 'returns false' do
        expect(pawn.move([1, 2])).to be false
      end

      it 'does not update the pawns location' do
        pawn.move([1, 2])
        expect(pawn.instance_variable_get(:@location)).to eq([1, 0])
      end
    end

    context 'when it is the pawns first move' do
      before do
        pawn.instance_variable_set(:@no_of_moves, 0)
      end
      it 'allows the player to move two steps forwards' do
        expect(pawn.move([1, 2])).to be true
      end
    end
  end

  describe '#eat' do
    it 'allows the pawn to eat right' do
      expect(pawn.eat([0, 1])).to be true
    end

    it 'updates the pawns location' do
      new_loc = [0, 1]
      pawn.eat(new_loc)
      expect(pawn.instance_variable_get(:@location)).to eq(new_loc)
    end

    it 'allows the pawn to eat right' do
      expect(pawn.eat([2, 1])).to be true
    end
  end
end
