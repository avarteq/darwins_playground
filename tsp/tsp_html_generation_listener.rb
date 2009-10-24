require 'erb'

class TspHtmlGenerationListener
  
  def initialize
    template_path = File.dirname(__FILE__) + "/../gui/map_template.erb"
    @map_path = File.dirname(__FILE__) + "/../gui/current_map.html"
    
    @template = ERB.new(File.open(template_path).read)
  end
  
  def generation_change_event(generation_count, new_generation)
    if (generation_count % 50 == 0) then
      @polyline = new_generation.fittest.to_g_polyline

      File.open(@map_path, "w+") do |f|
        f.puts @template.result(binding)
      end
    
      puts "\n\nRefreshed map.\n\n"
    end
  end  
end