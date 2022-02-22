require 'rails_helper'

RSpec.describe 'stores/index', type: :view do
  before do
    assign(:stores, [
      Store.create!(name: 'Doe drinks', owner: 'John Doe'),
      Store.create!(name: 'Doe drinks', owner: 'John Doe')
    ])
  end

  it 'renders a list of stores' do
    render
    assert_select 'a', text: 'Nova importação'.to_s, count: 1
    assert_select 'tr>td', text: 'Doe drinks'.to_s, count: 2
    assert_select 'tr>td', text: 'John Doe'.to_s, count: 2
  end
end
