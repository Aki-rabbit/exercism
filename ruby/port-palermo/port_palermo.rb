module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0,4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    if ship_identifier.to_s.start_with?("OIL" , "GAS")
      'Terminal A'
    else 
      'Terminal B'
    end
  end
end

#最初の4文字を取り出して、大文字で返す

