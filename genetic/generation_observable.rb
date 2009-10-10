module GenerationObservable
  def generation_listeners    
    initialize_generation_listeners
    @generation_listeners
  end
  
  def initialize_generation_listeners
    @generation_listeners ||= []
  end
  
  def add_generation_listener(listener)
    initialize_generation_listeners
    @generation_listeners << listener
  end
  
  def remove_generation_listener(listener)
    initialize_generation_listeners
    @generation_listeners.delete(listener)
  end
  
  def fire_generation_change_event(generation_count, new_generation)
    initialize_generation_listeners
    @generation_listeners.each do |listener| 
      listener.generation_change_event(generation_count, new_generation)
    end
  end
end