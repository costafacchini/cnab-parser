require 'rails_helper'

RSpec.describe Store, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '#owner' do
    it { is_expected.to validate_presence_of :owner }
  end

  describe '#transactions' do
    it { is_expected.to have_many(:transactions).dependent(:restrict_with_error) }
  end

  describe '#balance' do
    it 'sums the value of store transactions' do
      store = described_class.create!(name: 'Doe drinks', owner: 'John Doe')
      Transaction.create!(store_id: store.id, value: 10)
      Transaction.create!(store_id: store.id, value: -3)

      another_store = described_class.create!(name: 'Second Store', owner: 'Mary Jane')
      Transaction.create!(store_id: another_store.id, value: 10)

      expect(store.balance).to eq(7.0)
    end
  end
end
