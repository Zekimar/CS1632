require_relative 'Place.rb'
require_relative 'Driver.rb'

raise "enter a seed and only a seed" unless ARGV.count == 1
seed = ARGV[0].to_i
$prng = Random::new seed

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
