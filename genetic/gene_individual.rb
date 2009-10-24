class GeneIndividual < Individual
  
  attr_accessor :genes
  
  def initialize
    @genes = []
  end

   # Returns an random gene
  def random_gene
    return @genes.at(random_index)
  end

  # Returns a number betw. 0 and size-1
  def random_gene_index
    return (rand * @genes.size).to_i
  end

  # Swap positions of the genes specified by their indices.
  def swap_gene_positions(index_1, index_2)
    tmp_gene = @genes.at(index_1)
    @genes[index_1] = @genes[index_2]
    @genes[index_2] = tmp_gene
  end
  
  def ==(other)
    @genes == other.genes
  end
  
  def to_s
    ret = ""
    @genes.each do |gene|
      ret += gene.to_s + "-"
    end
    ret.chop!
    return ret
  end
end