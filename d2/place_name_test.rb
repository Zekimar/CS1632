require 'minitest/autorun'
require_relative 'city_sin_9006'

 # UNIT TESTS FOR METHOD Place.to_s
 # ensures that the method correctly prints the name variable
 # of a place object
 # does not need equivlance classes because the method merely returns a
 # variable

class PlaceNameTest < Minitest::Test

#ensures that a Place object is not nil when created
def test_name:
  pl = Place::new "t"
  assert_equal "t", pl.to_s
end
