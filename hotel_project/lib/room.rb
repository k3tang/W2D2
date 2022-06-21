class Room
    attr_reader :capacity, :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end 

  def full?
    @capacity > @occupants.length ? false : true
  end 

  def available_space
    @capacity - @occupants.length
  end 

  def add_occupant(name)
    if !(self.full?)
        @occupants << name 
        return true 
    else 
        return false
    end 
  end 

end