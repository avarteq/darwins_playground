$LOAD_PATH << File.dirname(__FILE__) + "/.."

require "tsp/linear_distance"
require "tsp/linear_distance_fitness"
require "tsp/geo_coordinate"
require "genetic/generation_observable"
require "genetic/mutation"
require "genetic/gene"
require "genetic/individual"
require "genetic/gene_individual"
require "genetic/generation"
require "genetic/evolver"
require "tsp/round_trip_individual"
require "tsp/city"
require 'tsp/shuffle_mutation'
require 'tsp/partly_shuffle_mutation'
require 'tsp/tsp_generation_listener'




origin = RoundTripIndividual.origin
evolver = Evolver.new(origin, ShuffleMutation.new, PartlyShuffleMutation.new)
evolver.add_generation_listener(TspGenerationListener.new)
evolver.evolve
