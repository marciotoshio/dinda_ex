require 'spec_helper'

describe DindaEx::BalanceCalculator do
  context 'with a accounts file that has 2 acocunts and a transactions file that has 5 transactions' do
    before(:each) {
      allow(CSV).to receive(:read).with('accounts_file_path.csv') { [["123", "32112"], ["321", "3251"]]  }
      allow(CSV).to receive(:read).with('transactions_file_path.csv') { [['123,1050'],['321,105'],['123', '2035'], ['123,150'], ['321,5000']] }
    }
    
    let(:balance_calculator) { DindaEx::BalanceCalculator.new('accounts_file_path.csv', 'transactions_file_path.csv') }
    
    it 'loads a list of accounts' do
        expect(balance_calculator.accounts.length).to eq(2)
    end
      
    it 'loads a list of transactions' do
      expect(balance_calculator.transactions.length).to eq(5)
    end
  end
end
