class CycleCrossover
  
  # Create two offsprings from two parents.
  # == Parents
  # <tt>mom = (2 - 3 - 5 - 7 - 1 - 6 - 4)</tt>
  # <tt>dad = (4 - 5 - 6 - 3 - 2 - 7 - 1)</tt>
  # 
  # == Step a)
  # a) Choose a gene from the first parent (e.g. gene=3, index=1). Add it to the cycle.
  # <tt>Cycle: (3)</tt>
  # Search for gene with the same index in Dad's genes (gene=5, index=1). Add it to the cycle.
  # <tt>Cycle: (3 - 5)</tt>
  # Search for the corresponding gene (gene=5, index=2) in Mom's genes.
  # Look for the gene at index 2 at Dad's genes (gene=6, index=2).
  # Add it to the cycle.
  # <tt>Cycle: (3 - 5 - 6)</tt>
  #
  # Search for the corresponding gene in Dad's gens (gene=6, index=5).
  # Look for the gene at index 5 (gene=7, index=5).
  # Add it to the cycle.
  # <tt>Cycle: (3 - 5 - 6 - 7)</tt>
  # ...
  # Repeat this strategy until the cycle has been closed <tt>3 - .... - 3</tt>.
  # <tt>Cycle: (3 - 5 - 6 - 7 - 3)</tt>
  # === Step b)
  # b) Genes which are in the cycle will be taken over from their parents
  # <tt>moms_child = (x - 3 - 5 - 7 - x - 6 - x)</tt>
  # <tt>dads_child = (x - 5 - 6 - 3 - x - 7 - x)</tt>
  # === Step c)
  # c) Missing genes of the childs will be taken from the other parent.
  # <tt>moms_child = (4 - 3 - 5 - 7 - 2 - 6 - 1)</tt>
  # <tt>dads_child = (2 - 5 - 6 - 3 - 1 - 7 - 4)</tt>
  #
  # http://rosin-online.de/ki/cycleCrossover.html
  def exec(current_generation)    
    debug = false
    
    mom = current_generation.random_individual
    puts "\nMOM:" if debug
    puts mom.to_s  if debug
    
    dad = current_generation.random_individual    
    puts "\nDAD:" if debug
    puts dad.to_s  if debug
    
    family = Family.new(mom, dad)
    
    cycle = create_cycle(family)

    puts "\nCYCLE:" if debug
    cycle.each{ |i| print i.to_s + "-" } if debug
    
    family.select_mom  
    moms_child = create_child_from_parent_and_cycle(family, cycle)
    puts "\nMOMs:" if debug
    puts moms_child.to_s  if debug
     
    family.select_dad    
    dads_child = create_child_from_parent_and_cycle(family, cycle)
    puts "\nDADs:" if debug
    puts dads_child.to_s if debug
    
  
    current_generation << moms_child
    current_generation << dads_child    
  end
  
  def create_cycle(family)    
    cycle = []    
    
    # Get the index of the randomly choosen gene.
    # This will be the first gene in our cycle.
    # mom, e.g. index 2, gene 3
    index = family.current.random_gene_index
    
    # Add the selected gene to the cycle
    cycle << family.current.genes[index]
            
    begin                   
      # Switch to the other parent (dad)
      family.alternate
            
      # Find the previous in mom selected gene in dad (index 3, gene 3)
      index = family.current.genes.index(cycle.last)
      
      # Switch to the other parent (mom)
      family.alternate
            
      # Use the index (3) to get the corresponding gene (index 3, gene 7) in moms gens.
      # Add the selected gene to the cycle
      cycle << family.current.genes[index]
      
    ### exit condition
    end while(cycle.first != cycle.last) # until we have a cycle e.g. 2-3-4-5-2
    return cycle
  end
  
  protected
  
  def create_child_from_parent_and_cycle(family, cycle)
    currents_child = RoundTripIndividual.new
    family.current.genes.size.times do |i|
      currents_gene = family.current.genes[i]
      if cycle.include?(currents_gene) then
        currents_child.genes << currents_gene
      else
        currents_child.genes << family.other.genes[i]
      end
    end
    return currents_child    
  end
end

# Helps to alternatingly select a parent.
# Mom, dad, mom, dad, ...
class Family
  def initialize(mom, dad)
    select_mom
    
    # Parent array needed to alternate between the parents
    @parents = [mom, dad]
  end
  
  # Returns the current parent
  def current
    @parents[@current_parent_index]
  end
  
  # Returns the currently not selected parent.
  def other
    @parents[other_index(@current_parent_index)]
  end
  
  # 1,0,1,0,...
  def alternate
    @current_parent_index = other_index(@current_parent_index)
  end
  
  def select_mom
    @current_parent_index = 0
  end
  
  def select_dad
    @current_parent_index = 1
  end
  
  protected
  
  # 1,0,1,...
  # Does not affect the object's state.
  def other_index(index)
    if index == 1 
      index = 0
    else
      index = 1
    end
    return index
  end
end