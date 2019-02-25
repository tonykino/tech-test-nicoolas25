require_relative 'keypad'

class Level1

  def initialize
    @correspondence_table = KeyPad::Correspondence_table
  end

  def multi_tap_to_word(input)
    encoded_chars = encoded_string_to_chars(input)
    decode_all_chars(encoded_chars).join
  end

  def word_to_multi_tap(input)
    chars = input.chars
    encode_all_chars(chars).join
  end

  private

    def encoded_string_to_chars(str)
      str.to_s.scan(/((\d)\2*)/).map(&:first)
    end

    def decode_all_chars(encoded_chars)
      chars = []
      encoded_chars.each do |encoded_char|
        chars << decode(encoded_char)
      end
      chars
    end

    def decode(encoded_char)
      @correspondence_table.key(encoded_char).to_s
    end

    def encode_all_chars(chars)
      encoded_chars = []
      chars.each do |char|
        unless encoded_chars.empty?
          encoded_chars << ' ' if encoded_chars.last.chr == encode(char).chr
        end
        encoded_chars << encode(char)
      end
      encoded_chars
    end

    def encode(char)
      @correspondence_table[char.to_sym]
    end
end

if __FILE__ == $0
  p Level1.new.multi_tap_to_word('844330442 2225544466407 7776665332228')
  p Level1.new.word_to_multi_tap('the hacking project')
end
