class RoundTripIndividual < GenIndividual
  def initialize
    @fitness_function = LinearDistanceFitness    
  end
  
  def self.build_from_genes(genes)
    individual = new
    individual.genes = genes
    return individual
  end
  
  # Create the first individual. It is build from 
  # the list of cities.
  def self.origin
    origin = build_from_genes( City.build_from_csv_file(File.dirname(__FILE__) + "/coordinates.csv") )    
    return origin
  end
end