require_relative "room"

class Hotel

    attr_reader :name, :rooms

    def initialize(name, hash)
        @name = name        
        @rooms = {}
        hash.each {|k, v| @rooms[k] = Room.new(v) }
    end

    def name
        words = @name.split
        new_words = []
        words.each {|word| new_words << word.capitalize}
        new_words.join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room)
        if room_exists?(room) == false
            puts "sorry, room does not exist"
        else
            if @rooms[room].add_occupant(person) == true
               puts "check in successful"
            else
               puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        counter = 0
        @rooms.each {|k, v| counter += 1 if @rooms[k].full? == true}
        if counter == @rooms.length
            return false
        else
            true
        end
    end

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} #{v.available_space}"
        end
    end

end
