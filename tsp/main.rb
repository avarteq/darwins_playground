require 'init'

origin = RoundTripIndividual.origin
evolver = Evolver.new(origin, CycleCrossover.new, PartlyShuffleMutation.new)
evolver.add_generation_listener(TspTxtGenerationListener.new)
evolver.evolve(1000)
