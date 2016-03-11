require 'spec_helper'

describe Array do

  describe '#any_empty?' do
    it 'returns true when there is an empty elements inside the array' do
      expect(['', 'A', ''].any_empty?).to be_truthy
    end

    it 'returns false when there is no empty elements inside the array' do
      expect(['C', 'A', 'B'].any_empty?).to be_falsey
    end

    it 'returns false for an empty Array' do
      expect([].any_empty?).to be_falsey
    end
  end

  describe '#all_empty?' do
    it 'returns true when all elements of the array are empty' do
      expect(['', '', ''].all_empty?).to be_truthy
    end

    it 'returns false when some elements are not empty' do
      expect(["", 1, Object.new, :a].all_empty?).to be_falsey
    end

    it 'returns true for an empty Array' do
      expect([].all_empty?).to be_truthy
    end
  end

  describe '#all_same?' do
    it 'returns true when all elements are the same' do
      expect(["A","A","A"].all_same?).to be_truthy
    end

    it 'returns false when some of the elements are not the same' do
      expect(["A","B","A"].all_same?).to be_falsey
    end

    it 'returns true for an empty Array' do
      expect([].all_same?).to be_truthy
    end
  end
end
