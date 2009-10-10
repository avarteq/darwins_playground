require File.dirname(__FILE__) + "/../../" + "tsp/linear_distance"
require File.dirname(__FILE__) + "/../../" + "tsp/linear_distance_fitness"
require File.dirname(__FILE__) + "/../../" + "tsp/geo_coordinate"
require File.dirname(__FILE__) + "/../../" + "genetic/gene"
require File.dirname(__FILE__) + "/../../" + "genetic/individual"
require File.dirname(__FILE__) + "/../../" + "genetic/mutation"
require File.dirname(__FILE__) + "/../../" + "genetic/gene_individual"
require File.dirname(__FILE__) + "/../../" + "genetic/generation"
require File.dirname(__FILE__) + "/../../" + "tsp/round_trip_individual"
require File.dirname(__FILE__) + "/../../" + "tsp/city"
require File.dirname(__FILE__) + "/../../" + "tsp/shuffle_mutation"

describe Generation do

  before(:each) do
    @g = Generation.new
    origin = RoundTripIndividual.origin
    @g << origin
    second_individual = ShuffleMutation.new.exec(@g)
  end
  
  it "should create a generation with two individuals" do
    @g.size.should be(2)
  end
  
  it "should sort the generation by fitness ASC" do 
    
    # .each { |i| puts i.fitness }
    sorted = @g.sort
    sorted[0].fitness.should <= sorted[1].fitness
    
    #puts g.min.fitness
  end
  
  it "should find the fittest individual" do
    i = @g.fittest
    
    # The fittest should also be the first element in the sorted list (sortet by fittness ASC)
    sorted = @g.sort
    i.should be(sorted.first)
  end  
  
  it "should find the fittest n individuals" do
    fittest = @g.fittest_n(2)
    2.times { |i| fittest[i].should be_instance_of(RoundTripIndividual) }
    sorted = @g.sort
    2.times { |i| fittest[i].should be(sorted[i]) }
  end
end