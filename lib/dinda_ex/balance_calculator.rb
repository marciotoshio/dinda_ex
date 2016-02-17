require 'csv'

module DindaEx
  class BalanceCalculator
    
    attr_reader :accounts, :transactions
    
    def initialize(accounts_path, transactions_path)
      @accounts = CSV.read(accounts_path)
      @transactions = CSV.read(transactions_path)
    end
  end
end
