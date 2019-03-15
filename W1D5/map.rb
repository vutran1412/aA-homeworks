class Map
    

    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key, value]
    end

    def get(key)
        @map.each {|sub_arr| return sub_arr if sub_arr[0] == key }
    end

    def delete(key)
        sub_arr = get(key)
        @map.delete(sub_arr) unless sub_arr.nil?
    end

    def show
        @map
    end
end