# creates an Oyster class
class Oystercard
  attr_reader :balance, :journeys

  $MAXV = 90

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def top_up(value)
    raise 'New balance exceeds #{MAXV}' if balance + value > $MAXV
    @balance += value
  end

  def touch_in(entry_station)
    raise 'Bal lower than #{MINV}' if balance < $MINV
    deduct(current_journey.fare) if in_journey?
    @journeys << Journey.new(entry_station)
  end

  def touch_out(station)
    if in_journey?
      current_journey.exit_station = station
    else
      @journeys << Journey.new.exit_station = exit_station
    end
    deduct(current_journey.fare)
  end

  def in_journey?
    return false if @journeys.is_empty?
    @journeys.last.incomplete?
  end

  def current_journey
    @journeys.last
  end




  private

  def deduct(fare)
    @balance -= fare
  end

end
