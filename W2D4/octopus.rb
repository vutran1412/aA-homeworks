FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus
    FISHES.each_with_index do |fish1, idx1|
        max_length = true
        FISHES.each_with_index do |fish2, idx2|
            next if idx1 == idx2
            max_length = false if fish2.length > fish1.length
        end
        return fish1 if max_length
    end
end

class Array
    def merge_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        return self if length <= 1
        mid = length / 2
        left = self.take(mid).merge_sort(&prc)
        right = self.drop(mid).merge_sort(&prc)

        Array.merge(left, right, &prc)
    end

    def self.merge(left, right, &prc)
        merged = []
        until left.empty? || right.empty?
            if prc.call(left.first, right.first) == 1
                merged << right.shift
            else
                merged << left.shift
            end
        end
        merged + left + right
    end
end

def dominant_octopus
    prc ||= Proc.new { |a, b| a.length <=> b.length }
    FISHES.merge_sort(&prc).last
end

def clever_octopus
    bigest_fish = FISHES.first

    FISHES.each do |fish|
        if fish.length > bigest_fish.length
            bigest_fish = fish
        end
    end
    bigest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |tiles, idx|
        return idx if direction == tiles
    end
end

def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end