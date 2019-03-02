# frozen_string_literal: true

require 'level0/level0.rb'

describe Level0 do
  describe '#multiply' do
    describe 'with factor' do
      subject { Level0.new.multiply(nb, factor) }
      let(:nb) { 4 }
      let(:factor) { 6 }

      it { is_expected.to be(24) }
    end

    describe 'without factor' do
      subject { Level0.new.multiply(nb) }
      let(:nb) { 5 }

      it { is_expected.to be(15) }
    end
  end
end
