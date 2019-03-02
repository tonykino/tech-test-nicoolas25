# frozen_string_literal: true

require_relative 'multi_tap_converter'

p MultiTapConverter.new.word_to_multi_tap(ARGV[0])
