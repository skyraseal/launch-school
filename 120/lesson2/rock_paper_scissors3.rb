class RPSGame
  @@winning_goal = 10

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      human.add_point
      puts "#{human.name} gained a point!"
    elsif human.move < computer.move
      computer.add_point
      puts "#{computer.name} gained a point!"
    else
      puts "It's a tie!"
    end
  end

  def display_game_winner
    if human.score > computer.score
      puts "#{human.name} wins the game with #{human.score} points!  #{computer.name} got #{computer.score} points."
    elsif human.score < computer.score
      puts "#{computer.name} wins the game with #{computer.score} points!  #{human.name} got #{human.score} points."
    end
  end

  def display_score
    puts "(#{human.score}  -  #{computer.score})"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return true if answer.downcase == "y"
    return false if answer.downcase == "n"
  end

  def play
    display_welcome_message

    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_round_winner
        break if (human.score >= @@winning_goal) || (computer.score >= @@winning_goal)
        display_score
      end
      display_game_winner
      break unless play_again?
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Rock Paper Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock Papar Scissors. Goodbye!"
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  ROCK = {win: ['scissors', 'lizard'], lose: ['paper', 'spock']}
  PAPER = {win: ['rock', 'spock'], lose: ['scissors', 'lizard']}
  SCISSORS = {win: ['paper', 'lizard'], lose: ['rock', 'spock']}
  LIZARD = {win: ['paper', 'spock'], lose: ['rock', 'scissors']}
  SPOCK = {win: ['scissors', 'rock'], lose: ['paper', 'lizard']}

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    compared_move = other_move.value
    if rock?
      ROCK[:win].include?(compared_move)
    elsif paper?
      PAPER[:win].include?(compared_move)
    elsif scissors?
      SCISSORS[:win].include?(compared_move)
    elsif lizard?
      LIZARD[:win].include?(compared_move)
    elsif spock?
      SPOCK[:win].include?(compared_move)
    end
  end

  def <(other_move)
    compared_move = other_move.value
    if rock?
      ROCK[:lose].include?(compared_move)
    elsif paper?
      PAPER[:lose].include?(compared_move)
    elsif scissors?
      SCISSORS[:lose].include?(compared_move)
    elsif lizard?
      LIZARD[:lose].include?(compared_move)
    elsif spock?
      SPOCK[:lose].include?(compared_move)
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score
  attr_reader :move_history

  def initialize
    set_name
    @score = 0
    @move_history = []
  end

  def add_point
    @score += 1
  end

  def record_last_move
    @move_history << move
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    valid_moves = Move::VALUES
    loop do
      puts "Please choose: #{valid_moves}"
      choice = gets.chomp
      break if valid_moves.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    record_last_move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    record_last_move
  end
end

module Characters
  class R2D2 < Computer
    # spock doesn't exist
    @@choice_probability = {
                             'rock' => 1,
                             'paper' => 1,
                             'scissors' => 1,
                             'lizard' => 1,
                             'spock' => 0
                           }
    @@choice = []
    @@choice_probability.each do |type, probability|
      probability.times {@@choice << type}
    end

    def choose
      self.move = Move.new(@@choices.sample)
    end
  end

  class Hal < Computer
    # Goes rock most of the time
  end

  class Chappie < Computer
    # More traditional player, will go lizard and spock the least
  end

  class Sonny < Computer
    # Lizard and spock player
  end

  class Number5 < Computer
    # Balanced player
  end
end

RPSGame.new.play
