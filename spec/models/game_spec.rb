require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { create(:game) }

  describe '#moves' do
    it { is_expected.to respond_to(:moves) }
  end

  describe '#result' do
    it { is_expected.to respond_to(:result) }
  end
end
