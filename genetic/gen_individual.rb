class GenIndividual < Individual
  
  attr_accessor :genes
  
  def initialize
    @genes = []
  end
end