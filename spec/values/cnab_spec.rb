require 'rails_helper'

RSpec.describe Cnab do
  describe '#kind' do
    it 'returns the kind of transaction' do
      line = '1'
      cnab = described_class.new(line)

      expect(cnab.kind).to be 1
    end
  end

  describe '#emitted_at' do
    it 'returns the emitted_at of transacion in timezone UTC -3' do
      line = ' 20190301                                 153453'
      cnab = described_class.new(line)

      expect(cnab.emitted_at).to eq(Time.parse('2019-03-01 15:34:53').in_time_zone('UTC'))
    end
  end

  describe '#value' do
    it 'returns the value of transacion' do
      line = '         0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be 142.0
    end

    it 'returns the value positive if kind is debit' do
      line = '1        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be 142.0
    end

    it 'returns the value negative if kind is boleto' do
      line = '2        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be(-142.0)
    end

    it 'returns the value negative if kind is financing' do
      line = '3        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be(-142.0)
    end

    it 'returns the value positive if kind is credit' do
      line = '4        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be 142.0
    end

    it 'returns the value positive if kind is load' do
      line = '5        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be 142.0
    end

    it 'returns the value positive if kind is bill' do
      line = '6        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be 142.0
    end

    it 'returns the value positive if kind is ted' do
      line = '7        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be 142.0
    end

    it 'returns the value positive if kind is doc' do
      line = '8        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be 142.0
    end

    it 'returns the value negative if kind is rent' do
      line = '9        0000014200'
      cnab = described_class.new(line)

      expect(cnab.value).to be(-142.0)
    end
  end

  describe '#cpf' do
    it 'returns the cpf of transacion' do
      line = '                   09620676017'
      cnab = described_class.new(line)

      expect(cnab.cpf).to eq('09620676017')
    end
  end

  describe '#card' do
    it 'returns the card number of transacion' do
      line = '                              4753****3153'
      cnab = described_class.new(line)

      expect(cnab.card).to eq('4753****3153')
    end
  end

  describe '#store_owner' do
    it 'returns the store owner of transacion' do
      line = '                                                JOÃO MACEDO   '
      cnab = described_class.new(line)

      expect(cnab.store_owner).to eq('JOÃO MACEDO')
    end
  end

  describe '#store_name' do
    it 'returns the store owner of transacion' do
      line = '                                                              BAR DO JOÃO        '
      cnab = described_class.new(line)

      expect(cnab.store_name).to eq('BAR DO JOÃO')
    end
  end
end
