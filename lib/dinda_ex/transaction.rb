module DindaEx
  class Transaction
    
    attr_reader :account_id, :value
    
    def initialize(account_id, value)
      @account_id = account_id
      @value = value 
    end
    
    def is_debit?
        @value < 0
    end
  end
end
