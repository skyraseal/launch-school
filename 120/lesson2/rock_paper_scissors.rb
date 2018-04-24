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
  VALUES = ['rock', 'paper', 'scissors']

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

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def add_point
    @score += 1
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
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

RPSGame.new.play
