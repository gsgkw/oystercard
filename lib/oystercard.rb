# creates an Oyster class
class Oystercard
  attr_reader :balance

  MAX_VALUE = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(value)
    raise 'New balance exceeds #{MAX_VALUE}' if balance + value > MAX_VALUE
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end


end
