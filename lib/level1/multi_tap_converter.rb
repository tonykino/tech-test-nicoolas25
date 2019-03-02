# frozen_string_literal: true

require_relative 'keypad'

class MultiTapConverter
  def multi_tap_to_word(input)
    splitted_taps = input.scan(/2+|3+|4+|5+|6+|7+|8+|9+|0+/)
    taps_to_chars(splitted_taps).join
  end

  def word_to_multi_tap(input)
    splitted_chars = input.chars
    chars_to_taps(splitted_chars).join
  end

  private

    def taps_to_chars(taps)
      taps.map(&method(:tap_to_char))
    end

    def tap_to_char(tap)
      KeyPad::CORRESPONDENCE_TABLE.key(tap)
    end

    def chars_to_taps(chars)
      # I would like to use map the same way as taps_to_chars method forward
      # But I can't see how to pass in argument the building array taps
      # (Pas certain du tout de mon anglais, je fais référence au array taps qui serait renvoyé par map que j'utilise au fur et à mesure de la boucle)
      # It seems it use some Proc knowledge that I am far to master
      # chars.map(&method(:char_to_tap_and_add_space_if_needed ?))
      taps = []
      chars.each do |char|
        taps << char_to_tap_and_add_space_if_needed(taps, char)
      end
      taps
    end

    # This method doesn't seem very 'clean' to me, does it exist a better way to write it ?
    # I tried to put the condition in another method "need_to_add_a_space?" who returned a boolean
    # but I am not convinced it's usefull
    def char_to_tap_and_add_space_if_needed(taps, char)
      return " #{char_to_tap(char)}" if taps.any? && taps.last[-1] == char_to_tap(char)[0]

      char_to_tap(char)
    end

    def char_to_tap(char)
      KeyPad::CORRESPONDENCE_TABLE.fetch(char)
    end
end

if $PROGRAM_NAME == __FILE__
  p MultiTapConverter.new.multi_tap_to_word('844330442 2225544466407 7776665332228')
  p MultiTapConverter.new.word_to_multi_tap('the hacking project')
end
