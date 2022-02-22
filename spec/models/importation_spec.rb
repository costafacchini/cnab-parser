require 'rails_helper'

RSpec.describe Importation, type: :model do
  describe '#content' do
    it { is_expected.to validate_presence_of :content }
  end
end
