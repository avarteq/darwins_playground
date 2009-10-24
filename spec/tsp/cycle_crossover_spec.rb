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
require File.dirname(__FILE__) + "/../../" + "tsp/shuffle_mutation"
require File.dirname(__FILE__) + "/../../" + "tsp/cycle_crossover"

describe CycleCrossover do
  
  it "should create mom and dad" do
    
    # For a crossover operation we need at least two individuals.
    g = create_mom_and_dad
    g.size.should be(2)
    
    # g.size.times { |i| g[i].should be_instance_of(RoundTripIndividual) }
  end
  
  it "should generate a valid cycle. In a valid cycle the last and first elements are the same." do
    g = create_mom_and_dad
    
    cycle_crossover = CycleCrossover.new
    mom = g.first
    dad = g.last
    family = Family.new(mom, dad)
    cycle = cycle_crossover.create_cycle(family)
    cycle.first.should == cycle.last
  end

  it "should generate a valid cycle. A valid cycle has at least 2 genes" do
    g = create_mom_and_dad    
    cycle_crossover = CycleCrossover.new
    mom = g.first
    dad = g.last
    family = Family.new(mom, dad)
    cycle = cycle_crossover.create_cycle(family)
    cycle.size.should have_at_least(2).items
  end

  it "should generate a valid cycle. A valid cycle does not have more elements than a parent has genes" do
    g = create_mom_and_dad    
    cycle_crossover = CycleCrossover.new
    mom = g.first
    dad = g.last
    
    family = Family.new(mom, dad)
    cycle = cycle_crossover.create_cycle(family)
    cycle.size.should have_at_most(mom.genes.size).items
  end
  
  it "should generate two individuals" do 
    g = create_mom_and_dad    
    old_size = g.size
    cycle_crossover = CycleCrossover.new
    cycle_crossover.exec(g)
    g.size.should be(old_size+2)
  end
end

def create_mom_and_dad
  g = Generation.new
  origin = RoundTripIndividual.origin
  g << origin
  ShuffleMutation.new.exec(g)
  return g
end