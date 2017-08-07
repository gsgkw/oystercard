# creates an Oyster class
class Oystercard
  attr_reader :balance

  MAX_VALUE = 90
  MIN_VALUE = 1

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(value)
    raise 'New balance exceeds #{MAX_VALUE}' if balance + value > MAX_VALUE
    @balance += value
  end

  def touch_in
    raise 'New balance lower than #{MIN_VALUE}' if balance < MIN_VALUE
    @in_use = true
  end

  def touch_out(fare)
    @in_use = false
    deduct(fare)
  end

  def in_journey?
    @in_use
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
