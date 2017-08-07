# creates an Oyster class
class Oystercard
  attr_reader :balance, :entry_station

  MAXV = 90
  MINV = 1

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(value)
    raise 'New balance exceeds #{MAXV}' if balance + value > MAXV
    @balance += value
  end

  def touch_in(entry_station)
    raise 'New balance lower than #{MINV}' if balance < MINV
    @in_use = true
    @entry_station = entry_station
  end

  def touch_out(fare)
    @in_use = false
    deduct(fare)
    @entry_station = nil
  end

  def in_journey?
    @in_use
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
