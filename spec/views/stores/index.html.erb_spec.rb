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
    assert_select 'tr>td', text: 'Doe drinks'.to_s, count: 2
    assert_select 'tr>td', text: 'John Doe'.to_s, count: 2
    assert_select 'form[action=?][method=?]', importations_path, 'post' do
      assert_select 'input[name=?]', 'importation[content]'
    end
  end
end
