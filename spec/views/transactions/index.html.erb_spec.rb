require 'rails_helper'

RSpec.describe 'transactions/index', type: :view do
  before do
    store = Store.create(name: 'Store 1', owner: 'Owner 1')

    assign(:transactions, [
      Transaction.create!(
        emitted_at: Time.zone.now,
        value: 9.99,
        cpf: 'Cpf',
        card: 'Card',
        kind: 2,
        store_id: store.id
      ),
      Transaction.create!(
        emitted_at: Time.zone.now,
        value: 9.99,
        cpf: 'Cpf',
        card: 'Card',
        kind: 2,
        store_id: store.id
      )
    ])
  end

  it 'renders a list of transactions' do
    render
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 'Cpf'.to_s, count: 2
    assert_select 'tr>td', text: 'Card'.to_s, count: 2
    assert_select 'tr>td', text: 'Boleto Saída -'.to_s, count: 2
  end
end
