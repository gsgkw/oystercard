# creates an Oyster class
class Oystercard
  attr_reader :balance, :journeys

  $MAXV = 90

  def initialize(balance = 1)
    @balance = balance
    @journeys = []
  end

  def top_up(value)
    raise 'New balance exceeds #{MAXV}' if balance + value > $MAXV
    @balance += value
  end

  def touch_in(args)
    raise 'Bal lower than #{MINV}' if balance < $MINV
    deduct(current_journey.fare) if in_journey?
    @journeys << Journey.new(args)
  end

  def touch_out(args)
    if in_journey?
      current_journey.exit_station = args[:exit_station]
    else
      @journeys << Journey.new(args)
    end
    deduct(current_journey.fare)
  end

  def in_journey?
    return false if @journeys.empty?
    current_journey.incomplete?
  end

  def current_journey
    @journeys.last
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
