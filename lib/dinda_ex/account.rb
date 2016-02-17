module DindaEx
  class Account
    
    attr_reader :id, :balance
    
    def initialize(id, current_balance)
      @id = id
      @balance = current_balance 
    end
  end
end
