raise "enter a seed and only a seed" unless ARGV.count == 1
seed = ARGV[0].to_i
$prng = Random::new seed

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

class Driver
  attr_reader :name
  attr_accessor :location
  attr_reader :toys
  attr_reader :books
  attr_reader :classes

  def update location
    if location == "Hillman"
      @books += 1
    elsif  location == "Museum"
      @toys += 1
    elsif  location. == "Cathedral"
      @classes *= 2
    end
  end

  def initialize name, location
    raise "location must be Place object" unless location.instance_of? Place
    @name = name
    @location = location
    @toys = 0
    @books = 0
    @classes = 1
    update @location.to_s
  end

  def move
    choice = $prng.rand(2)
    if choice == 1
      puts "#{@name} going from #{@location.to_s} to #{@location.n1_to_s} via #{@location.street1}"
      @location = @location.instance_variable_get(:@neighbor1)
    else
      puts "#{@name} going from #{@location.to_s} to #{@location.n2_to_s} via #{@location.street2}"
      @location = @location.instance_variable_get(:@neighbor2)
    end
    update @location.to_s
    @location
  end
end

downtown = Place::new "Downtown"
monroeville = Place::new "Monroeville"
hillman = Place::new "Hillman"
hospital = Place::new "Hospital"
cathedral = Place::new "Cathedral"
museum = Place::new "Museum"

hillman.setNeighbors(downtown, hospital)
hillman.setStreets("Fifth Ave.", "Foo St.")
hospital.setNeighbors(hillman, cathedral)
hospital.setStreets("Foo St.", "Fourth Ave.")
cathedral.setNeighbors(museum, monroeville)
cathedral.setStreets("Bar St.", "Fourth Ave.")
museum.setNeighbors(hillman, cathedral)
museum.setStreets("Fifth Ave.", "Bar St.")
choices = [hillman, hospital, cathedral, museum]

for i in 1..5 do
  j = $prng.rand(4)
  d = Driver::new "Driver #{i}", choices[j]
  loc = d.move.to_s
  while loc != "Downtown" && loc != "Monroeville"
    loc = d.move.to_s
  end
  puts "#{d.name} Acquired #{d.toys} toys!"
  puts "#{d.name} Acquired #{d.books} books!"
  puts "#{d.name} Attended #{d.classes} classes!"
end
