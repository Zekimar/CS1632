require 'minitest/autorun'
require_relative 'city_sim_9006'


#UNIT TESTS FOR METHOD Place.setNeighbors
#EQUIVALENCE CLASSES:
#neighbor1 is set
#neighbor2 is set
#exception is thrown when neighbors are not Place objects

class PlaceNeighborTest < Minitest::Test

  #uses stubbing to ensure that @neighbor1 is proprly assigned to the
  #value of a given variable test1
  def test_neighbor_1
    neighbor1 = nil
    test1 = "test"
    neighbor1 = test1
    assert_equal "test", neighbor1
  end
  #uses stubbing to ensure that @neighbor2 is properly assigned to the
  #value of test2
  def test_neighbor_2
    neighbor2 = nil
    test2 = "test2"
    neighbor2 = test2
    assert_equal "test2", neighbor2
  end

  #ensures that an error is thrown when parameters for setNeighbors
  #are not Place objects
  #EDGE CASE
  def test_neighbors_exception
    testPlace = Place::new "test"
    assert_raises "neighbors should be place objects" do
      testPlace.setNeighbors("test", 1)
    end
  end
end 
