class Blackjack
  CARD_VALUE = {
      "ace" => 11,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9,
      "ten" => 10,
      "jack" => 10,
      "queen" => 10,
      "king" => 10
    }.freeze

    def self.parse_card(card)
      CARD_VALUE.fetch(card, 0)
    end
  
  def self.card_range(card1, card2)
    player_score = self.parse_card(card1) + self.parse_card(card2)

    case player_score
    when 4..11 then "low"
    when 12..16 then "mid"
    when 17..20 then "high"
    when 21 then "blackjack"  
    end
  end

  def self.first_turn(card1, card2, dealer_card)
   
    if (card1 == "ace" && card2 == "ace")
      return "P"
    end

    dealer_score = self.parse_card(dealer_card)
    
    case self.card_range(card1, card2)
    when "blackjack" 
      if ["ace", "king", "queen", "jack", "ten"].include?(dealer_card)
         "S"
      else
         "W"
      end
    when "high" then "S"
    when "mid" 
      if dealer_score >= 7
         "H"
      else
          "S"
      end
    when "low" then "H"
    end
  end
end
