require 'time'
require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/block_rooms'
require_relative '../lib/hotel_admin'
require_relative '../lib/reservation'
