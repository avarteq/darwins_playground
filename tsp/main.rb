$LOAD_PATH << File.dirname(__FILE__) + "/.."

require "tsp/linear_distance"
require "tsp/linear_distance_fitness"
require "tsp/geo_coordinate"
require "genetic/mutation"
require "genetic/gene"
require "genetic/individual"
require "genetic/gen_individual"
require "genetic/generation"
require "genetic/evolver"
require "tsp/round_trip_individual"
require "tsp/city"
require 'tsp/shuffle_mutation'



origin = RoundTripIndividual.origin
evolver = Evolver.new(origin, nil, ShuffleMutation.new)
evolver.evolve
