require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq, :guess

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @guess = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end


  def game_over?
    if seq != guess
      @game_over = true
    end
  end


  def take_turn
    add_random_color
    new_round_message
    show_next_color
    require_guess

    game_over?
    if game_over ==  false
      round_success_message
      increment_seq
      reset_guesses
    end
  end


  def increment_seq
    @sequence_length += 1
  end

  def reset_guesses
    @guess = []
  end

  def new_round_message
    system('clear')
    p "It's a new round! The current length is #{sequence_length}"
  end


  def require_guess
    until guess.count == sequence_length
      p "Please provide a guess"
      @guess << gets.chomp.strip
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def show_next_color
    color = seq.last
    p "The next color is #{color}. Please provide the full sequence!"

  end

  def round_success_message
    p "You guessed correctly!"
  end

  def game_over_message
    p "You guessed wrong. Game over!"

  end



  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if  __FILE__ == $PROGRAM_NAME
  game = Simon.new.play
end
