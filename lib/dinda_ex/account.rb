module DindaEx
  class Account
    
    attr_reader :id, :balance
    
    def initialize(id, current_balance)
      @id = id
      @balance = current_balance 
    end
    
    def do_transactions(transactions)
      transactions.each do |t|
        next if t.account_id != @id
        @balance += t.value
      end
      self
    end
  end
end
