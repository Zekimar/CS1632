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
