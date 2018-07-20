class VisaCreditCard

  attr_reader :name, :number, :balance

  def initialize(name, number)
    @name = name
    @number = number

    @balance = 0
  end


  class << self
    def card_type
      'VISA'
    end
  end

  def topup(amount)
    @balance += amount
  end

  def charge(amount)
    if enough_balance?(amount)
      adjust_balance(amount)
      true
    else
      false
    end
  end


  private

  def enough_balance?(amount)
    @balance >= amount
  end

  def adjust_balance(amount)
    @balance -= amount
  end

end
