# frozen_string_literal: true

require_relative 'keypad'

class MultiTapConverter
  def multi_tap_to_word(input)
    encoded_chars = encoded_string_to_encoded_chars(input)
    decode_all_chars(encoded_chars).join
  end

  def word_to_multi_tap(input)
    chars = input.chars
    encode_all_chars(chars).join
  end

  private

    def encoded_string_to_encoded_chars(str)
      str.scan(/2+|3+|4+|5+|6+|7+|8+|9+|0+/)
    end

    def decode_all_chars(encoded_chars)
      encoded_chars.map(&method(:decode))
    end

    def decode(encoded_char)
      KeyPad::CORRESPONDENCE_TABLE.key(encoded_char)
    end

    def encode_all_chars(chars)
      # I would like to use map the same way as decode_all_chars method forward
      # But I can't see how to pass in argument the building array (encoded_chars below)
      # (Pas certain du tout de mon anglais, je fais référence au array encoded_chars qui serait renvoyé par map que j'utilise au fur et à mesure de la boucle)
      # It seems it use some Proc knowledge that I am far to master
      # chars.map(&method(:encode_and_add_space_if_needed ?))
      encoded_chars = []
      chars.each do |char|
        encoded_chars << encode_and_add_space_if_needed(encoded_chars, char)
      end
      encoded_chars
    end

    # This method doesn't seem very 'clean' to me, does it exist a better way to write it ?
    # I tried to put the condition in another method "need_to_add_a_space?" who returned a boolean
    # but I am not convinced it's usefull
    def encode_and_add_space_if_needed(encoded_chars, char)
      return " #{encode(char)}" if encoded_chars.any? && encoded_chars.last[-1] == encode(char)[0]
      encode(char)
    end

    def encode(char)
      KeyPad::CORRESPONDENCE_TABLE.fetch(char)
    end
end

if $PROGRAM_NAME == __FILE__
  p MultiTapConverter.new.multi_tap_to_word('844330442 2225544466407 7776665332228')
  p MultiTapConverter.new.word_to_multi_tap('the hacking project')
end
