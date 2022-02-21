require 'rails_helper'

RSpec.describe Store, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '#owner' do
    it { is_expected.to validate_presence_of :owner }
  end
end
