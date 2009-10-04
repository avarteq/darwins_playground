require File.dirname(__FILE__) + "/../../" + "tsp/linear_distance"
require File.dirname(__FILE__) + "/../../" + "tsp/linear_distance_fitness"
require File.dirname(__FILE__) + "/../../" + "tsp/geo_coordinate"
require File.dirname(__FILE__) + "/../../" + "genetic/gene"
require File.dirname(__FILE__) + "/../../" + "genetic/individual"
require File.dirname(__FILE__) + "/../../" + "genetic/gen_individual"
require File.dirname(__FILE__) + "/../../" + "tsp/round_trip_individual"
require File.dirname(__FILE__) + "/../../" + "tsp/city"

describe RoundTripIndividual do
  
  it "should a individual containing 21 cities from csv file" do
    origin = RoundTripIndividual.origin
    origin.should be_instance_of(RoundTripIndividual)
    origin.genes.size.should be(21)
    origin.genes[0].should be_instance_of(City)
  end
end