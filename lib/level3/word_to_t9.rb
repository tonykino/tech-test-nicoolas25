# frozen_string_literal: true

require_relative 't9_converter'

p T9Converter.new.word_to_t9(ARGV[0])
