require 'minitest/autorun'
require_relative '../Place'
require_relative '../Driver'

 # UNIT TESTS FOR METHOD Place.n2_to_s
 # ensures that the method correctly prints neighbor2's name
 # does not need equivlance classes because the method merely returns a
 # variable

class PlaceNeighbor2NameTest < Minitest::Test

  #ensures that neighbor1's name variable is returned
  def test_n2_to_s:
    a = Place::new "test"
    b = Place::new "n1"
    c = Place::new "n2"
    a.setNeighbors(b, c)
    assert_equal "n2", a.n2_to_s
  end
end
