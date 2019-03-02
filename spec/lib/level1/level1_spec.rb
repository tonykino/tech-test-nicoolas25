# frozen_string_literal: true

require 'level1/multi_tap_converter.rb'

describe MultiTapConverter do
  describe '#multi_tap_to_word' do
    subject { MultiTapConverter.new.multi_tap_to_word(input) }
    let(:input) { '844330442 2225544466407 7776665332228' }

    it { is_expected.to eq('the hacking project') }
  end

  describe '#word_to_multi_tap' do
    subject { MultiTapConverter.new.word_to_multi_tap(input) }
    let(:input) { 'the hacking project' }

    it { is_expected.to eq('844330442 2225544466407 7776665332228') }
  end
end
