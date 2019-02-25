require 'level0/zero.rb'

describe Zero do
  describe '#multiply' do

    describe 'with factor' do
      subject { Zero.new.multiply(nb, factor) }
      let(:nb) { 4 }
      let(:factor) { 6 }

      it { is_expected.to be(24) }
    end

    describe 'without factor' do
      subject { Zero.new.multiply(nb) }
      let(:nb) { 5 }

      it { is_expected.to be(15) }
    end
  end
end
