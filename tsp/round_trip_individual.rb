class RoundTripIndividual < GeneIndividual
  def initialize
    super
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
  
  def to_g_polyline
    ret = ""
    ret += 'polyline = new GPolyline([' + "\n"
    @genes.each do |city|
      coord = city.geo_coordinate
      ret += '    ' + coord.to_g_lat_lng + ",\n"
    end
      ret += '    ' + @genes.first.geo_coordinate.to_g_lat_lng + ", \n"
    ret += '], "#FF0000", 3, 1, polyOptions);'
    return ret
  end
end