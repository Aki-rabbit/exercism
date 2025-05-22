class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed <= 4
      Float @speed * 221 
    elsif @speed <= 8
      Float @speed * 221 * 0.9
    elsif @speed == 9
      Float @speed * 221 * 0.8
    else
      Float @speed * 221 * 0.77
    end
  end

  def working_items_per_minute
    Integer (production_rate_per_hour/60)
  end
end