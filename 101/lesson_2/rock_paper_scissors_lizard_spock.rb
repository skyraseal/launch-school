require 'yaml'

MESSAGES = YAML.load_file('rpsls_messages.yml')
LANGUAGE = 'en'

rock = MESSAGES[LANGUAGE]['rock']
paper = MESSAGES[LANGUAGE]['paper']
scissors = MESSAGES[LANGUAGE]['scissors']
lizard = MESSAGES[LANGUAGE]['lizard']
spock = MESSAGES[LANGUAGE]['spock']

RPS_MOVES = { # list of possible moves, key is user input
  '1' => rock,
  '2' => paper,
  '3' => scissors,
  '4' => lizard,
  '5' => spock
}

RPS_COMPARISONS = { # key beats values
  rock => [lizard, scissors],
  paper => [spock, rock],
  scissors => [paper, lizard],
  lizard => [paper, spock],
  spock => [rock, scissors]
}

def clear
  if Gem.win_platform?
    system('cls')
  else
    system('clear')
  end
end

def prompt(message_key, custom_data1 = nil, custom_data2 = nil)
  message = MESSAGES[LANGUAGE][message_key]

  if message
    message = format(
                message,
                custom_data1: custom_data1,
                custom_data2: custom_data2
                )
  else
    message = message_key
  end

  puts(">> #{message}")
end

def valid_choice?(choice)
  RPS_MOVES.key?(choice)
end

def translate_input_to_move(input)
  RPS_MOVES[input]
end

def request_user_choice
  choice = ''

  prompt('request_user_move')
  RPS_MOVES.each do |key, value|
    prompt("#{key}: #{value}")
  end
  loop do
    choice = gets.chomp

    break if valid_choice?(choice)
    prompt('invalid_user_choice') 
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
    prompt('win')
  elsif win?(computer, player)
    prompt('lose')
  else
    prompt('tie')
  end
end

def modify_scoreboard(scores, player, computer)
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
  prompt('play_again')
  try_again = ''

  loop do
    try_again = gets.chomp.downcase
    break if ['y', 'yes', 'ye', 'n', 'no'].include?(try_again)
    prompt('invalid_try_again')
  end

  ['y', 'ye', 'yes'].include?(try_again)
end

scores = { player: 0, computer: 0 }

loop do
  clear

  prompt('welcome')
  prompt('instructions')

  display_score(scores[:player], scores[:computer])

  user_choice = translate_input_to_move(request_user_choice)
  computer_choice = generate_computer_choice

  prompt('player_choices', user_choice, computer_choice)

  display_results(user_choice, computer_choice)

  modify_scoreboard(scores, user_choice, computer_choice)

  display_score(scores[:player], scores[:computer])

  break unless request_try_again?
end

prompt('thanks_for_playing')
