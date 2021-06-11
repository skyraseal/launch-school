INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
                 [1, 5, 9], [3, 5, 7]] # diagonals

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, score)
  system 'clear'
  puts "First to five wins!"
  puts "PLAYER: #{score[:player]}   -   COMPUTER: #{score[:computer]}"
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def prompt(message)
  puts "=> #{message}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { player: 0, computer: 0 }
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry, invalid choice. Try again."
  end

  brd[square] = PLAYER_MARKER
end

def comp_places_piece!(brd)
  square = if !find_at_risk_square(brd).empty?
             find_at_risk_square(brd).sample
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(brd)
  if offensive_spaces(brd).size > 0
    offensive_spaces(brd)
  else
    defensive_spaces(brd)
  end
end

def defensive_spaces(brd)
  defensive_spaces = []
  risky_lines = []
  WINNING_LINES.each do |line|
    risky_lines << line if brd.values_at(*line).count(PLAYER_MARKER) == 2
  end

  risky_lines.each do |line|
    line.each do |space|
      defensive_spaces << space if brd[space] != COMPUTER_MARKER && brd[space] != PLAYER_MARKER
    end
  end
  defensive_spaces
end

def offensive_spaces(brd)
  offensive_spaces = []
  opportune_lines = []
  WINNING_LINES.each do |line|
    opportune_lines << line if brd.values_at(*line).count(COMPUTER_MARKER) == 2
  end

  opportune_lines.each do |line|
    line.each do |space|
      offensive_spaces << space if brd[space] != COMPUTER_MARKER && brd[space] != PLAYER_MARKER
    end
  end
  offensive_spaces
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(array, delimiter=', ', andor='or')
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{andor} ")
  else
    array_copy = array.dup
    last_element = array_copy.pop.to_s
    joint = array_copy.join(delimiter)
    joint << delimiter + "#{andor} " + last_element
  end
end

def place_piece!(brd, current_player)
  case current_player
  when 'player' then player_places_piece!(brd)
  when 'computer' then comp_places_piece!(brd)
  end
end

def alternate_player(current_player)
  return 'player' if current_player == 'computer'
  return 'computer' if current_player == 'player'
end

loop do
  starting_player = ''
  loop do
    prompt "Who should go first? (player or computer)"
    starting_player = gets.chomp.downcase
    break if starting_player == 'player' || starting_player == 'computer'
    prompt "Invalid entry. Please choose 'player' or 'computer' only."
  end

  score = initialize_score

  loop do
    board = initialize_board
    display_board(board, score)
    current_player = starting_player

    loop do
      place_piece!(board, current_player)
      display_board(board, score)
      break if someone_won?(board) || board_full?(board)
      current_player = alternate_player(current_player)
    end

    if someone_won?(board)
      case detect_winner(board)
      when 'Player' then score[:player] += 1
      when 'Computer' then score[:computer] += 1
      end
      display_board(board, score)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    break if score[:player] >= 5 || score[:computer] >= 5
    prompt "Continue the match? (y or n)"
    answer = gets.chomp.downcase
    break unless answer.start_with?('y')
  end

  prompt "Player wins the game, #{score[:player]} - #{score[:computer]}!" if score[:player] == 5
  prompt "Computer wins the game, #{score[:player]} - #{score[:computer]}!" if score[:computer] == 5

  prompt "Start a new match? (y or n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing tic-tac-toe! Goodbye."
