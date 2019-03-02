# require_relative 'keypad'
#
# def multi_tap_to_word(input)
#   splitted_taps = input.scan(/2+|3+|4+|5+|6+|7+|8+|9+|0+/)
#   taps_to_chars(splitted_taps).join
# end
#
# def taps_to_chars(taps)
#   taps.map(&method(:tap_to_char))
# end
#
# def tap_to_char(tap)
#   KeyPad::CORRESPONDENCE_TABLE.key(tap)
# end
#
# p multi_tap_to_word(ARGV[0])
#

# One liner version

require_relative 'keypad'

def multi_tap_to_word(input)
  input.scan(/2+|3+|4+|5+|6+|7+|8+|9+|0+/).map(&method(:tap_to_char)).join
end

def tap_to_char(tap)
  KeyPad::CORRESPONDENCE_TABLE.key(tap)
end

p multi_tap_to_word(ARGV[0])
