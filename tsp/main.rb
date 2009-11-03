require 'init'

origin = RoundTripIndividual.origin
evolver = Evolver.new(origin, CycleCrossover.new, PartlyShuffleMutation.new)
evolver.generation_size = 150
evolver.add_generation_listener(TspTxtGenerationListener.new)
evolver.evolve(200)
