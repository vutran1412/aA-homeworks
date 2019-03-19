class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each

    @cups = Array.new(14) { Array.new }
    @cups.each_with_index do |cup, idx|
      4.times { cup << :stone } unless idx == 13 || idx == 6
    end
    cups
  end

  def valid_move?(start_pos)
    valid_pos = [1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12]
    raise 'Starting cup is empty' if start_pos == 0
    raise "Invalid starting cup" unless valid_pos.include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
