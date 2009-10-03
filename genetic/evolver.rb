# Manages the evolutionary process
class Evolver
  
  attr_accessor :recombination_operation, :mutation_operation, :selection_operation
  
  # === Parameters
  # +genesis+:: First individual
  def initialize(genesis, recombination_operation, mutation_operation)
    @recombination_probability = 0.75
    @mutation_probability = 1 - @recombination_probability
    
    @generation_size = 100
    
    # Operations
    @recombination_operation = recombination_operation
    @mutation_operation = mutation_operation
    @selection_operation = SurvivalOfTheFittest.new
    
    @current_generation = []
    @next_generation = []
  end
  
  # Start evolutionary process
  def evolve
    
  end
  
  protected
  
  # Perform a change from one to another generation.
  def generation_change
  end
end