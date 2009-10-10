require File.dirname(__FILE__) + "/../../" + "tsp/linear_distance"
require File.dirname(__FILE__) + "/../../" + "tsp/linear_distance_fitness"
require File.dirname(__FILE__) + "/../../" + "tsp/geo_coordinate"
require File.dirname(__FILE__) + "/../../" + "genetic/gene"
require File.dirname(__FILE__) + "/../../" + "genetic/individual"
require File.dirname(__FILE__) + "/../../" + "genetic/gene_individual"
require File.dirname(__FILE__) + "/../../" + "genetic/mutation"
require File.dirname(__FILE__) + "/../../" + "genetic/generation"
require File.dirname(__FILE__) + "/../../" + "tsp/round_trip_individual"
require File.dirname(__FILE__) + "/../../" + "tsp/city"
require File.dirname(__FILE__) + "/../../" + "tsp/partly_shuffle_mutation"

describe PartlyShuffleMutation do
  
  it "should create a second round trip individual" do
    @g = Generation.new
    origin = RoundTripIndividual.origin
    @g << origin
    PartlyShuffleMutation.new.exec(@g)
    @g.size.times { |i| @g[i].should be_instance_of(RoundTripIndividual) }
  end
end