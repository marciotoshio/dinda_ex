require 'spec_helper'

describe DindaEx::Account do
  let(:account) { DindaEx::Account.new(123, 150) }
  context 'with only credit transactions' do
    let(:transactions) { [DindaEx::Transaction.new(123, 1000), DindaEx::Transaction.new(123, 1500), DindaEx::Transaction.new(123, 300)] }
    it 'can do transactions' do
      expect(account.do_transactions(transactions).balance).to eq(2950)
    end
  end
  
  context 'with credit and debit transactions' do
    let(:transactions) { [DindaEx::Transaction.new(123, 1000), DindaEx::Transaction.new(123, 1500), DindaEx::Transaction.new(123, -300)] }
    it 'can do transactions' do
      expect(account.do_transactions(transactions).balance).to eq(2350)
    end
    
    it 'apply the fine if your account becomes negative after a debit' do
      transactions << DindaEx::Transaction.new(123, -3050)
      expect(account.do_transactions(transactions).balance).to eq(-1200)
    end
  end
  
  context 'with transactions that not belongs to account' do
    let(:transactions) { [DindaEx::Transaction.new(321, 1000), DindaEx::Transaction.new(123, 1500), DindaEx::Transaction.new(123, -300)] }
    it 'can do transactions correctly' do
      expect(account.do_transactions(transactions).balance).to eq(1350)
    end
  end
  
  context 'with an account with positive balance' do
    let(:ok_account) { DindaEx::Account.new(1, 1000) }
    it {expect(ok_account.is_in_debit?).to be false }
  end
  
  context 'with an account with negative balance' do
    let(:ok_account) { DindaEx::Account.new(1, -1000) }
    it {expect(ok_account.is_in_debit?).to be true  }
  end
end