module DindaEx
  class Account
    
    attr_reader :id, :balance
    
    def initialize(id, current_balance)
      @id = id
      @balance = current_balance 
    end
    
    def do_transactions(transactions)
      transactions.select{ |t| t.account_id == @id }.each do |t|
        @balance += t.value
        apply_fine(t)
      end
      self
    end
    
    def is_in_debit?
      @balance < 0
    end
    
    private 
    
    def apply_fine(transaction)
      @balance -= 500 if is_in_debit? && transaction.is_debit?
    end
  end
end
