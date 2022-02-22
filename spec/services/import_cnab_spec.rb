require 'rails_helper'

RSpec.describe ImportCnab, type: :model do
  let(:content) { File.read(Rails.root.join('spec/fixtures/files/cnab.txt')) }

  describe '#call' do
    it 'imports the cnab stores' do
      expect { described_class.call(content) }.to change(Store, :count).by(3)
    end

    it 'imports the cnab transactions' do
      expect { described_class.call(content) }.to change(Transaction, :count).by(4)
    end

    # rubocop:disable RSpec/MultipleExpectations
    it 'imports the cnab parsed data' do
      described_class.call(content)
      store = Store.first
      expect(store.owner).to eq('JOÃO MACEDO')
      expect(store.name).to eq('BAR DO JOÃO')

      transaction = Transaction.where(kind: 5).first
      expect(transaction.kind).to eq('loan')
      expect(transaction.emitted_at).to eq(Time.parse('2019-03-01 14:56:07').in_time_zone('UTC'))
      expect(transaction.value).to eq(132.0)
      expect(transaction.cpf).to eq('55641815063')
      expect(transaction.card).to eq('3123****7687')
    end
    # rubocop:enable RSpec/MultipleExpectations

    it 'does not import any store if the line is blank' do
      expect { described_class.call('') }.not_to change(Store, :count)
    end

    it 'does not import any transaction if the line is blank' do
      expect { described_class.call('') }.not_to change(Transaction, :count)
    end
  end
end
