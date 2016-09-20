class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(6) {[:stone,:stone,:stone, :stone]}
    @cups << []
    @cups += Array.new(6) {[:stone, :stone, :stone, :stone]}
    @cups << []

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14 || start_pos <1
  end

  def make_move(start_pos, current_player)
    curr_arr = []
    curr_arr, @cups[start_pos] = @cups[start_pos], curr_arr
    if @player1 == current_player
      opponent_cup = 13
    else
      opponent_cup = 6
    end
    # curr_arr.each_with_index do |stone,index|
    #   @cups[(start_pos+1+index)%14] << stone unless (start_pos + 1 + index)%14 == opponent_cup
      # if (start_pos+1+index)%14 == opponent_cup
      #   @cups[(start_pos+2+index)%14] << stone
    # end
    index = 1
    until curr_arr.empty?
      @cups[(start_pos+index)%14] << curr_arr.shift unless (start_pos+index)%14 == opponent_cup
      if (start_pos+1+index)%14 == opponent_cup
        index+=1
      end
      index +=1
    end
    render
    next_turn(start_pos+index-1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :switch if @cups[ending_cup_idx%14].length == 1
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    return true if @cups[0..5].all? {|array| array.empty?}
    return true if @cups[7..12].all? {|array| array.empty?}
    false
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @player1
    elsif @cups[6].length < @cups[13].length
      return @player2
    else
      return :draw
    end
  end
end
