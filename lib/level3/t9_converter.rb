# frozen_string_literal: true

require_relative 'keypad'

class T9Converter
  def initialize
    @words = read_word_list
  end

  def t9_to_word(seq)
    possible_words(seq)[seq.count('1')]
  end

  def word_to_t9(seq)
    t9_word = word_to_taps(seq)
    add_ones_if_needed(t9_word, seq)
  end

  private

    def read_word_list
      Dir.chdir(File.dirname(__FILE__)) # permit to call ruby script from anywhere
      File.readlines('words_sorted_by_popularity.txt', chomp: true).map { |a| a.split("\t").first }
    end

    def possible_words(seq)
      @words.select { |word| seq.delete('1') == word_to_taps(word) }
    end

    def word_to_taps(seq)
      seq.chars.map(&method(:char_to_tap)).join
    end

    def char_to_tap(char)
      KeyPad::T9_CORRESPONDENCE_TABLE.find { |_key, value| value.include?(char) }.first
    end

    def add_ones_if_needed(t9_word, seq)
      word_position = possible_words(t9_word).index(seq)
      word_position.times { t9_word << '1' }
      t9_word
    end
end

if $PROGRAM_NAME == __FILE__
  # p T9Converter.new.t9_to_word('843111')
  p T9Converter.new.word_to_t9('debts')
end
