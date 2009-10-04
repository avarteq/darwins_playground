class RoundTripIndividual < GenIndividual
  def initialize
    @fitness_function = LinearDistanceFitness    
  end
  
  # Create the first individual. It is build from 
  # the list of cities.
  def self.origin
    origin = new    
    origin.genes = City.build_from_csv_file(File.dirname(__FILE__) + "/coordinates.csv")
    return origin
  end
end