require 'csv'

module DindaEx
  class BalanceCalculator
    
    attr_reader :accounts, :transactions
    
    def initialize(accounts_path, transactions_path)
      @accounts = init accounts_path, 'DindaEx::Account'
      @transactions = init transactions_path, 'DindaEx::Transaction'
      calculate_balances
    end
    
    def find_account(account_id)
      @accounts.select{|a| a.id == account_id }.first
    end
    
    def find_transactions(account_id)
      @transactions.select{|t| t.account_id == account_id }
    end
    
    def pretty_print
      @accounts.each { |a| puts "#{a.id},#{a.balance}" }
    end
    
    private 
    
    def init(path, class_name)
      klass  = Object.const_get(class_name)
      CSV.read(path).map{ |row| klass.new(row[0].to_i, row[1].to_i)}
    end
    
    def calculate_balances
      @accounts.each do |account|
        account.do_transactions(find_transactions(account.id))
      end
    end
  end
end
