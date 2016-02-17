require 'csv'

module DindaEx
  class BalanceCalculator
    
    attr_reader :accounts, :transactions
    
    def initialize(accounts_path, transactions_path)
      @accounts = init accounts_path, 'DindaEx::Account'
      @transactions = init transactions_path, 'DindaEx::Transaction'
    end
    
    private 
    
    def init(path, class_name)
      klass  = Object.const_get(class_name)
      CSV.read(path).map{ |row| klass.new(row[0], row[1])}
    end
  end
end
