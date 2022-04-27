class Room

    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if @occupants.length < @capacity
            false
        else
            true
        end
    end

    def available_space
        return @capacity - @occupants.length
    end

    def add_occupant(name)
        if full? == false
            @occupants << name
            return true
        else
            return false
        end
    end
end