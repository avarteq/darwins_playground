# Manages the evolutionary process
class Evolver
  
  attr_accessor :recombination_operation, :mutation_operation, :selection_operation
  
  # === Parameters
  # +origin+:: First individual
  def initialize(origin, recombination_operation, mutation_operation)
    @recombination_probability = 0 #0.75
    @mutation_probability = 1 - @recombination_probability
    
    @generation_size = 100
    @generation_count = 1
    @generation_survial_rate = 5
    
    # Operations
    @recombination_operation = recombination_operation
    @mutation_operation = mutation_operation
    
    # @selection_operation = SurvivalOfTheFittest.new
    
    @current_generation = Generation.new

    bootstrap(origin)
  end
  
  # Start evolutionary process
  def evolve
    100000.times do |i|      
      operator = choose_random_operation
      operator.exec(@current_generation)
      generation_change if (i % @generation_size == 0)
    end
  end  
  
  protected
  
  def choose_random_operation
    operation = nil
    
    # Random nr. btw. 0 and 1    
    if rand <= @recombination_probability then
      operation = @recombination_operation
    else
      operation = @mutation_operation
    end
    return operation
  end
  
  # Create the preliminaries to run all genetic operations.
  # We need at least two individuals for recombination.
  def bootstrap(origin)
    @current_generation << origin
    @mutation_operation.exec(@current_generation)
  end
  
  # Perform a change from one to another generation.
  def generation_change
    puts "Generation nr. #{@generation_count}"
    fittest_n = @current_generation.fittest_n(@generation_survial_rate)
    puts "\tGeneration's fittest individual: #{fittest_n.first.fitness}"
    
    # Open a new generation and add the surving individuals
    @current_generation = Generation.new
    fittest_n.each { |i| @current_generation << i } 
    @generation_count += 1
  end
end