require 'erb'

class TspTxtGenerationListener

  def initialize
    @coords_file_path = File.dirname(__FILE__) + "/../gui/current_coords.txt"
  end

  def generation_change_event(generation_count, new_generation)


    if (generation_count % 5 == 0) then
      fittest = new_generation.fittest      

        @last_fittest_fitness = fittest.fitness
        @polyline = fittest.to_g_polyline

        File.open(@coords_file_path, "w+") do |f|
          f.puts @polyline
        end

        puts "\n\nRefreshed coords.\n\n"
    end
  end
end