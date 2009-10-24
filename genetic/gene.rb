class Gene
  attr_accessor :gene_id
  
  def initialize(gene_id)
    raise "No gene id given" unless gene_id
    @gene_id = gene_id
  end
  
  # Comparision of two genes
  def ==(gene)
    return self.gene_id == gene.gene_id
  end
  
  def to_s
    @gene_id.to_s
  end
end