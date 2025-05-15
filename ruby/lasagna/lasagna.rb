class Lasagna

  def remaining_minutes_in_oven(actual_minutes_in_oven)
    raise 'Please implement the Lasagna#remaining_minutes_in_oven method'
    return Lasagna::EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
  end

  def preparation_time_in_minutes(layers)
    raise 'Please implement the Lasagna#preparation_time_in_minutes method'
    return layers * 2
  end

  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    raise 'Please implement the Lasagna#total_time_in_minutes method'
    return self.remaining_minutes_in_oven(actual_minutes_in_oven) + self.preparation_time_in_minutes(number_of_layers)
  end
end

Lasagna::EXPECTED_MINUTES_IN_OVEN = 40
lasagna = Lasagna.new
lasagna.remaining_minutes_in_oven(30)
lasagna.preparation_time_in_minutes(2)
lasagna.total_time_in_minutes(number_of_layers: 2, actual_minutes_in_oven: 30)