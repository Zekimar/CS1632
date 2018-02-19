raise "enter a seed and only a seed" unless ARGV.count == 1
seed = ARGV[0].to_i
$prng = Random::new seed

class Place
  @name = nil
  @neighbor1 = nil
  @neighbor2 = nil
  @street1 = nil
  @street2 = nil
  def initialize name
    @name = name
  end

  def setStreets street1, street2
    @street1 = street1
    @street2 = street2
  end

  def setNeighbors neighbor1, neighbor2
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

  def getn1
    @neighbor1
  end

  def getn2
    @neighbor2
  end

  def s1_to_s
    "#{@street1}"
  end

  def s2_to_s
    "#{@street2}"
  end
end

class Driver
  @name
  @location
  @toys
  @books
  @classes

  def initialize name, location
    @name = name
    @location = location
    @toys = 0
    @books = 0
    @classes = 1
    if @location.to_s == "Hillman"
      @books += 1
    elsif  @location.to_s == "Museum"
      @toys += 1
    elsif  @location.to_s == "Cathedral"
      @classes *= 2
    end
  end

  def move
    choice = $prng.rand(2)
    if choice == 1
      puts "#{@name} going from #{@location.to_s} to #{@location.n1_to_s} via #{@location.s1_to_s}"
      @location = @location.getn1
    else
      puts "#{@name} going from #{@location.to_s} to #{@location.n2_to_s} via #{@location.s2_to_s}"
      @location = @location.getn2
    end
    if @location.to_s == "Hillman"
      @books += 1
    elsif  @location.to_s == "Museum"
      @toys += 1
    elsif  @location.to_s == "Cathedral"
      @classes *= 2
    end
    @location
  end

  def toys
    @toys
  end

  def books
    @books
  end

  def classes
    @classes
  end

  def name
    @name
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
