# frozen_string_literal: true

Dir['./errors/*'].sort.each { |file| require file }
Dir['./models/*'].sort.each { |file| require file }

require 'byebug'
