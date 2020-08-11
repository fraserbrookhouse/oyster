class Oystercard

attr_reader :balance
MAXIMUM_BALANCE = 90
@in_journey = false

    def initialize
        @balance = 0
    end

    def top_up(money)
        fail 'Maximum balance of 90 reached' if money + balance > MAXIMUM_BALANCE
        @balance += money
    end 

    def deduct(money)
        @balance -= money
    end

    def in_journey?
        @in_journey 
    end
    
    def touch_in
      @in_journey = true
    end

    def touch_out
      @in_journey = false
    end
end 