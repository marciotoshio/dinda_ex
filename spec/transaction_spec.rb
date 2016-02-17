require 'spec_helper'

describe DindaEx::Transaction do
  context 'with an transaction which is credit' do
    let(:transaction) { DindaEx::Transaction.new(1, 1000) }
    it {expect(transaction.is_debit?).to be false }
  end
  
  context 'with an transaction which is debit' do
    let(:transaction) { DindaEx::Transaction.new(1, -1000) }
    it {expect(transaction.is_debit?).to be true  }
  end
end