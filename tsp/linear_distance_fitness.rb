class LinearDistanceFitness
  
  # Fitness = total length of round trip.
  # Length of round trip = sum of distances between the cities.
  def self.fitness(round_trip_individual)
    total = 0
    genes = round_trip_individual.genes
    
    genes.size.times do |i|
      if i < (genes.size - 1)
        
        # Add distance to the next city
        total += genes[i].distance_to(genes[i+1])
      else
        
        # Add the distance from the last city to the first city to
        # get a round trip.
        total += genes[i].distance_to(genes[0])
      end
    end
    return total
  end
end