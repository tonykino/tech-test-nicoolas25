# frozen_string_literal: true

require_relative 't9_converter'

p T9Converter.new.t9_to_word(ARGV[0])
