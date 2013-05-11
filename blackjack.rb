def calculate_value(cards)
  total_value = [0]
  cards.each do |card|
    value_on_card = card[1]
      if (2..10).include? value_on_card.to_i
        card_value = value_on_card.to_i
      elsif value_on_card == 'J' or value_on_card == 'Q'or value_on_card == 'K'
        card_value = 10
      elsif value_on_card == 'A'
        if total_value.inject{|sum,x| sum + x } > 10
          card_value = 1
        else
          card_value = 11
        end 
      end
      total_value << card_value
  end
  sum_values = total_value.inject{|sum,x| sum + x }
  sum_values
end

def deal_to(player, deck)
  player << deck.pop
end

puts "Welcome to Blackjack!"

# deck setup
suits = ["H", "D", "S", "C"]
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
deck = suits.product(cards)
   
# dealing the cards
deck.shuffle!
player_cards = []
dealer_cards = []

2.times do deal_to(dealer_cards, deck) end
2.times do deal_to(player_cards, deck) end

player_value = calculate_value(player_cards)
dealer_value = calculate_value(dealer_cards)

puts "Player holds: #{player_cards}. Total value: #{player_value}" 
puts "Dealer holds: #{dealer_cards}. Total value: #{dealer_value}"
