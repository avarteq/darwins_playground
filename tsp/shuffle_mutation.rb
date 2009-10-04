# Reorders cities of a round_trip_individual randomly.
class ShuffleMutation < Mutation
  
  # Takes a random individual from the current gerneration.
  # Reorders cities of a round_trip_individual randomly.
  # Adds the newly generated individual to the next generation.
  def exec(current_generation)    
    individual = current_generation.random_individual
    new_genes = individual.genes.sort_by { rand }
    new_individual = RoundTripIndividual.build_from_genes(new_genes)
    current_generation << new_individual
  end
end