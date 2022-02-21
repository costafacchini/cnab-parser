require 'rails_helper'

RSpec.describe 'stores/index', type: :view do
  before do
    assign(:stores, [
      Store.create!(name: 'Doe drinks', owner: 'John Doe'),
      Store.create!(name: 'Janes delivery', owner: 'Mary Jane')
    ])
  end

  it 'renders a list of stores' do
    render
  end
end
