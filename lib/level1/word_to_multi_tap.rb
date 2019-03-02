# frozen_string_literal: true

require_relative 'keypad'

def word_to_multi_tap(input)
  splitted_chars = input.chars
  chars_to_taps(splitted_chars).join
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

p word_to_multi_tap(ARGV[0])
