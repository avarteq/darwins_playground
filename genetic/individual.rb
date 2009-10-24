class Individual
  
  attr_accessor :fitness_function
  
  def initialize
    @fitness = nil
  end
  
  # Calculates the fitness of the individual by using the current
  # fitness function (strategy pattern).
  def fitness

    # Comput fitness only once (memoization)
    @fitness ||= @fitness_function.fitness(self)
  end
  
  def <=>(b)
    return self.fitness <=> b.fitness
  end
  
end