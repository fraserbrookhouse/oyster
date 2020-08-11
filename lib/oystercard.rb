class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  @in_journey = false

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise 'Maximum balance of 90 reached' if money + balance > MAXIMUM_BALANCE

    @balance += money
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Insufficient balance' if balance < MINIMUM_BALANCE

    @in_journey = true
  end

  def touch_out
    @in_journey = false
    self.deduct(MINIMUM_BALANCE)
  end

  private 

  def deduct(money)
    @balance -= money
  end
end
