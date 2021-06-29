RPS_MOVES = {
  1 => 'rock',
  2 => 'paper',
  3 => 'scissors',
  4 => 'lizard',
  5 => 'spock'
}

RPS_COMPARISONS = {
  'rock' => ['lizard', 'scissors'],
  'paper' => ['spock', 'rock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['rock', 'scissors']
}

def clear
  if Gem.win_platform?
    system('cls')
  else
    system('clear')
  end
end

def prompt(message)
  puts(">> #{message}")
end

def valid_choice?(choice)
  RPS_MOVES.has_key?(choice.to_i)
end

def translate_input_to_move(input)
  RPS_MOVES[input.to_i]
end

def request_user_choice
  choice = ''

  prompt("Enter the corresponding number for the move you want:")
  RPS_MOVES.each do |key, value|
    prompt("#{key}: #{value}")
  end
  loop do
    choice = gets.chomp

    if valid_choice?(choice)
      break
    else
      prompt("That's not a valid choice. Try again.")
    end
  end

  choice
end

def generate_computer_choice
  computer_choice = RPS_MOVES.keys.sample
  RPS_MOVES[computer_choice]
end

def win?(first, second)
  RPS_COMPARISONS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("It's a tie!")
  end
end

def modify_scores(scores, player, computer)
  if win?(player, computer)
    scores[:player] += 1
  elsif win?(computer, player)
    scores[:computer] += 1
  else
    scores[:player] += 1
    scores[:computer] += 1
  end
end

def display_score(player_score, computer_score)
  puts "  Player  |  Computer".center(50)
  puts "#{player_score}          #{computer_score}".center(50)
end

def request_try_again?
  prompt("Do you want to play again?")
  try_again = ''

  loop do
    try_again = gets.chomp.downcase
    break if ['y', 'yes', 'ye', 'n', 'no'].include?(try_again)
    prompt(MESSAGES[LANGUAGE]['incorrect_try_again_entry'])
  end

  ['y', 'ye', 'yes'].include?(try_again)
end

scores = {:player => 0, :computer => 0}

loop do
  clear
  puts "Welcome to Rock Paper Scissors Lizard Spock"
  display_score(scores[:player], scores[:computer])

  user_choice = translate_input_to_move(request_user_choice)
  computer_choice = generate_computer_choice

  puts "You chose: #{user_choice}; Computer chose: #{computer_choice}"
  display_results(user_choice, computer_choice)
  modify_scores(scores, user_choice, computer_choice)

  display_score(scores[:player], scores[:computer])
  break unless request_try_again?
end

prompt("Thanks for playing!")