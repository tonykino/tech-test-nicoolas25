require 'level1/level1.rb'

describe Level1 do
  describe '#multi_tap_to_word' do
    subject { Level1.new.multi_tap_to_word(input) }
    let(:input) { '844330442 2225544466407 7776665332228' }

    it { is_expected.to eq('the hacking project')}
  end

  describe '#word_to_multi_tap' do
    subject { Level1.new.word_to_multi_tap(input) }
    let(:input) { 'the hacking project' }

    it { is_expected.to eq('844330442 2225544466407 7776665332228') }
  end
end
