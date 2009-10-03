class Individual
  
  attr_accessor :fitness_function
  
  def initialize(fitness_function)
    @fitness_function = fitness_function
  end
  
  # Calculates the fitness of the individual by using the current
  # fitness function (strategy pattern).
  def fitness
    fitness_function.fitness(self)
  end
  
end