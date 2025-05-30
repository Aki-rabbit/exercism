module SavingsAccount
  def self.interest_rate(balance)
    if balance.negative?
      Float 3.213
    elsif balance < 1000
      Float 0.5
    elsif balance < 5000
      Float 1.621
    else  
      Float 2.475
    end
  end

  def self.annual_balance_update(balance)
    Float balance * (1 + (interest_rate(balance)/ 100))
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    balance = current_balance
    while balance < desired_balance
      balance = annual_balance_update(balance)
      years += 1
    end
    years
  end
end

