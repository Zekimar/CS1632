class Place
  @name
  @neighbor1
  @neighbor2
  attr_reader :street1
  attr_reader :street2
  def initialize name
    raise "name should be a string" unless name.is_a? String
    @name = name
  end

  def setStreets street1, street2
    @street1 = street1
    @street2 = street2
  end

  def setNeighbors neighbor1, neighbor2
    raise "neighbors should be place objects" unless neighbor1.instance_of? Place
    raise "neighbors should be place objects" unless neighbor2.instance_of? Place
    @neighbor1 = neighbor1
    @neighbor2 = neighbor2
  end

  def to_s
    "#{@name}"
  end

  def n1_to_s
    "#{@neighbor1.to_s}"
  end

  def n2_to_s
    "#{@neighbor2.to_s}"
  end
end
