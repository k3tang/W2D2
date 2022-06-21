require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = Hash.new{|hash, key| hash[key] = 0}
            hash.each do |k,v|
            @rooms[k] = Room.new(hash[k])
            end 
    end

    def name 
        array = @name.split(" ")
        array.map! {|word| word.capitalize}
        array.join(" ")
    end 

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end 

    def check_in(person, room_name)
        if room_exists?(room_name) 
            if @rooms[room_name].add_occupant(person) 
                    return p "check in successful"
            else 
                    return p "sorry, room is full" 
            end
        else
            return p "sorry, room does not exist"
        end
    end 

    def has_vacancy?
        if @rooms.all? {|k,v| @rooms[k].full?}
            return false 
        else 
            return true 

        end 
    end 

    def list_rooms
        list = @rooms.each do |k,v|
            puts "#{k} #{@rooms[k].available_space}"
        end 
    end 

end
