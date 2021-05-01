require 'rails_helper'

RSpec.describe Move, type: :model do
  subject { create(:move) }

  it { should belong_to(:game) }

  describe '#name' do
    it { is_expected.to respond_to(:name) }
  end

  describe '#move' do
    it { is_expected.to respond_to(:move) }
  end
end
