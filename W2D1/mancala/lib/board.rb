require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    place_stones
  end



  def place_stones
    (0..5).each{|idx| @cups[idx] = [:stone, :stone, :stone, :stone]}
    (7..12).each{|idx| @cups[idx] = [:stone, :stone, :stone, :stone]}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    moving_stones = @cups[start_pos].dup
    @cups[start_pos] = []

    render
  end

  # def current_plalyer_deposit_spots(current_player)
  #   @current_player == player1 ? (1..11).to_a

  def drop_stones(start_pos, current_player)

  end



  def next_turn(ending_cup_idx)
    [6,13].include?(ending_cup_idx) ? current_player_name : switch_player!
  end





  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[7..12].empty? ||cups[0..6].empty?
    false
  end

  def winner
    if one_side_empty?
      case @cups[6] <=> @cups[13]
      when -1
        return "Player 1 wins"
      when 0
        return :draw
      when 1
        return "Player 2 wins"
      end
    end
  end
end
