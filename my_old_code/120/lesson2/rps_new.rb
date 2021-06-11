class Player
  attr_accessor :name, :move
end

class Human < Player
  def initialize
    set_name
  end

  def choose
    choice = nil
      loop do 
        puts "Please choose rock, paper, or scissors:"
        choice = gets.downcase.chomp
        break if ['rock','paper','scissors'].include?(choice)
        puts "Please input valid choice (rock, paper, scissors)"
      end
    self.move = choice
  end

  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, please enter something."
    end
    self.name = n
  end
end

class Computer < Player
  def initialize
    set_name
  end

  def choose
    choice = ['rock','paper','scissors'].sample
    self.move = choice
  end

  def set_name
    n = ['Ripper', 'Tocky', 'Bummy-gear', 'Roflcopter'].sample
    self.name = n
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do 
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y','n'].include?(answer)
    end

    return true if answer == 'y'
    return false
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    end
  end

end # --------


RPSGame.new.play

