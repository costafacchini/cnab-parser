require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#store' do
    it { is_expected.to belong_to(:store).required }
  end

  describe '#kind' do
    it { is_expected.to validate_presence_of :kind }

    it do
      transaction = described_class.new

      expect(transaction).to define_enum_for(:kind)
        .with_values(none: 0, debit: 1, boleto: 2, financing: 3, credit: 4, loan: 5, bill: 6, ted: 7, doc: 8, rent: 9)
        .backed_by_column_of_type(:integer)
        .with_prefix(true)
    end
  end
end
