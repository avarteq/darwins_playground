# A generation represents a number of individuals.
class Generation < Array
  
  # Returns an random individual
  def random_individual
    return at(random_index)
  end
  
  # Sorting is actually up to the individual's <=> operator.
  def sort_by_fitness
    sort_by { |individual| individual.fitness }
  end
  
  # Sorting is actually up to the individual's <=> operator.
  def fittest
    min
  end
  
  # Returns the n fittest individuals.
  # Sorting is actually up to the individual's <=> operator.
  def fittest_n(n)
    sort_by_fitness[0, n]
  end
  
  protected
  
  # Returns a number betw. 0 and size-1
  def random_index
    return (rand * size).to_i
  end
end