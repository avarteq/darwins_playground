# Reorders cities of a round_trip_individual randomly.
class PartlyShuffleMutation < Mutation
  
  # Takes a random individual from the current gerneration.
  # Chooses two random cities and swaps their positions.
  # Adds the newly generated individual to the next generation.
  def exec(current_generation)    
    individual = current_generation.random_individual
    new_genes = individual.genes.dup
    new_individual = RoundTripIndividual.build_from_genes(new_genes)

    index_1 = new_individual.random_gene_index
    index_2 = new_individual.random_gene_index

    tmp_tene = new_individual.swap_gene_positions(index_1, index_2)

    current_generation << new_individual
  end
end