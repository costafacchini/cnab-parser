require 'rails_helper'

RSpec.describe 'stores/index', type: :view do
  before do
    store1 = Store.create!(name: 'Doe drinks', owner: 'John Doe')
    store2 = Store.create!(name: 'Doe drinks', owner: 'John Doe')
    store3 = Store.create!(name: 'Chocolat factory', owner: 'Willy Wonka')

    assign(:stores, [
      store1,
      store2,
      store3
    ])

    assign(:transactions, [
      Transaction.create!(
        emitted_at: Time.utc(2022, 2, 22, 10, 35, 0),
        value: 9.99,
        cpf: 'Cpf',
        card: 'Card',
        kind: 4,
        store_id: store1.id
      ),
      Transaction.create!(
        emitted_at: Time.utc(2022, 2, 21, 21, 47, 31),
        value: -29.4,
        cpf: 'Another Cpf',
        card: 'Another card',
        kind: 3,
        store_id: store3.id
      ),
      Transaction.create!(
        emitted_at: Time.utc(2022, 2, 22, 15, 23, 0),
        value: 5.9,
        cpf: 'Third Cpf',
        card: 'Third card',
        kind: 5,
        store_id: store3.id
      )
    ])
  end

  # rubocop:disable RSpec/ExampleLength
  it 'renders a list of stores' do
    render
    assert_select 'span', text: 'Doe drinks'.to_s, count: 2
    assert_select 'span', text: 'John Doe'.to_s, count: 2
    assert_select 'tr>td', text: '22/02/2022 07:35'.to_s, count: 1
    assert_select 'tr>td', text: 'R$9,99'.to_s, count: 2
    assert_select 'tr>td', text: 'Cpf'.to_s, count: 1
    assert_select 'tr>td', text: 'Card'.to_s, count: 1
    assert_select 'tr>td', text: 'Crédito Entrada +'.to_s, count: 1

    assert_select 'span', text: 'Chocolat factory'.to_s, count: 1
    assert_select 'span', text: 'Willy Wonka'.to_s, count: 1
    assert_select 'tr>td', text: '21/02/2022 18:47'.to_s, count: 1
    assert_select 'tr>td', text: 'R$-29,40'.to_s, count: 1
    assert_select 'tr>td', text: 'Another Cpf'.to_s, count: 1
    assert_select 'tr>td', text: 'Another card'.to_s, count: 1
    assert_select 'tr>td', text: 'Financiamento Saída -'.to_s, count: 1

    assert_select 'tr>td', text: '22/02/2022 12:23'.to_s, count: 1
    assert_select 'tr>td', text: 'Third Cpf'.to_s, count: 1
    assert_select 'tr>td', text: 'Third card'.to_s, count: 1
    assert_select 'tr>td', text: 'Recebimento Empréstimo Entrada +'.to_s, count: 1
    assert_select 'tr>td', text: 'R$-23,50'.to_s, count: 1

    assert_select 'form[action=?][method=?]', importations_path, 'post' do
      assert_select 'input[name=?]', 'importation[content]'
    end
  end
  # rubocop:enable RSpec/ExampleLength
end
