require 'minitest/autorun'
require_relative 'city_sin_9006'

 # UNIT TESTS FOR METHOD Place.n1_to_s
 # ensures that the method correctly prints neighbor1's name
 # does not need equivlance classes because the method merely returns a
 # variable

class PlaceNeighbor1NameTest < Minitest::Test

#ensures that neighbor1's name variable is returned
a = Place::new "test"
b = Place::new "n1"
c = Place::new "n2"
a.setNeighbors(b, c)
def test_n1_to_s:
  assert_equal "n1", a.n1_to_s
end
