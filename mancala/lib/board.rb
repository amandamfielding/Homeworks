class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    place_stones
    @player1 = name1
    @player2  = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,12)
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << stones.pop if @player1 == current_player_name
      elsif cup_idx == 13
        @cups[13] << stones.pop if @player2 == current_player_name
      else
        @cups[cup_idx] << stones.pop
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    return true if @cups[0..5].all? {|arr| arr.empty?} || @cups[7..12].all? {|arr| arr.empty?}
    false
  end

  def winner
    if @cups[6].length > @cups[13].length
      winner = @player1
    elsif @cups[6].length == @cups[13].length
      return :draw
    else
      winner = @player2
    end
    winner
  end
end
