require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :order }
    it { is_expected.to belong_to :product }
  end

  describe 'Factory' do
    it "should have a valid factory" do
      expect(create(:order_item)).to be_valid
    end
  end
end
