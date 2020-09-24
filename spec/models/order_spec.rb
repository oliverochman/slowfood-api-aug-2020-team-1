require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :order_items }
  end

  describe 'Factory' do
    it "should have a valid factory" do
      expect(create(:order)).to be_valid
    end
  end
end
