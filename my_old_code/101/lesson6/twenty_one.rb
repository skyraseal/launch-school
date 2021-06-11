SUITS = ['Spades', 'Clubs', 'Diamonds', 'Hearts']
CARD_FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
def prompt(message)
  puts "=> #{message}"
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

def initialize_deck
  deck = []
  CARD_FACES.each do |face|
    SUITS.each { |suit| deck.push [face, suit] }
  end

  deck
end

def initialize_round(deck, player_hand, dealer_hand)
  2.times do
    player_hand.push draw!(deck)
    dealer_hand.push draw!(deck)
  end
end

def shuffle(deck)
  deck.shuffle
end

def draw!(deck)
  deck.shift
end

def read_card(card)
  "#{card[0]}-#{card[1]}"
end

def list_hand(hand)
  joinor(hand.map { |card| read_card(card) }, ' ,', 'and')
end

def count_total(hand)
  face_value = hand.map { |card| card[0] }
  sum = 0
  face_value.each do |value|
    sum += if value == 'A'
             11
           elsif value == 'J' || value == 'Q' || value == 'K'
             10
           else
             value.to_i
           end
  end

  face_value.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(hand)
  count_total(hand) > 21
end

def play_again?
  prompt "Do you wish to play again? (y/n)"
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

loop do
  puts "T W E N T Y - O N E".center(28)
  deck = initialize_deck.shuffle
  player_hand = []
  dealer_hand = []
  initialize_round(deck, player_hand, dealer_hand)
  puts "=========================".center(28)
  prompt "Shuffling deck ...".center(25)
  prompt "Passing out cards ...".center(25)
  puts "=========================".center(28)
  prompt "Dealer's hand: #{read_card(dealer_hand[0])} and unknown card."
  prompt "Your hand: #{list_hand(player_hand)}."

  loop do # Player hit / stay
    prompt "Would you like to hit or stay? (h/s)"
    print 'Choice: '
    player_move = gets.chomp.downcase
    if player_move.start_with?('h')
      player_hand.push draw!(deck)
      prompt "Your hand: #{list_hand(player_hand)}."
      break if busted?(player_hand)
    elsif player_move.start_with?('s')
      prompt "You stayed at #{count_total(player_hand)}."
      break
    else
      prompt "(please enter 'h' or 's')"
    end
  end

  puts "~~`*`~~".center(28)

  if busted?(player_hand)
    prompt "#{count_total(player_hand)}! You busted, sorry!"
  else
    prompt "Dealer's turn! ..."
    prompt "Dealer hitting ..." if count_total(dealer_hand) < 17
    until count_total(dealer_hand) >= 17
      dealer_hand.push draw!(deck)
    end
    prompt "Dealer's hand: #{list_hand(dealer_hand)}."
    prompt "Dealer has a total of #{count_total(dealer_hand)}."

    # rubocop:disable Metrics/LineLength
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<".center(28)
    if busted?(dealer_hand)
      prompt "Dealer busted, you win!"
    elsif count_total(player_hand) == count_total(dealer_hand)
      prompt "It was a tie!"
    elsif count_total(player_hand) > count_total(dealer_hand)
      prompt "#{count_total(player_hand)} beats #{count_total(dealer_hand)}. You win!"
    else
      prompt "#{count_total(dealer_hand)} beats #{count_total(player_hand)}. You lose! :("
    end
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>".center(28)
    # rubocop:enable Metrics/LineLength
  end

  break unless play_again?
end
