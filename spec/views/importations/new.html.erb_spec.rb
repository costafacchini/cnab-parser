require 'rails_helper'

RSpec.describe 'importations/new', type: :view do
  before do
    assign(:importation, Importation.new(
                           content: fixture_file_upload('spec/fixtures/files/cnab.txt', 'text/plain')
                         ))
  end

  it 'renders new importation form' do
    render

    assert_select 'a', text: 'Lojas'.to_s, count: 1
    assert_select 'form[action=?][method=?]', importations_path, 'post' do
      assert_select 'input[name=?]', 'importation[content]'
    end
  end
end
