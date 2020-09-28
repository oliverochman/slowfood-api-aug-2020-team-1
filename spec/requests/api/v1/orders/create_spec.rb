RSpec.describe 'POST /api/v1/orders', type: :request do
  let!(:hamburger) {
    create(:product, name: 'Hamburger', price: 100)
  }

  let!(:product_that_wont_be_added_to_the_order) {
    create(:product, name: 'Bigos')
  } 

  let!(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json'}.merge!(credentials) }

  describe 'successfully' do
    before do
      post '/api/v1/orders', 
      params: { 
        product: hamburger.id 
      },
      headers: headers
    end

    it 'should respond with 200 status' do
      expect(response.status).to eq 200
    end

    it 'should respond with success message' do
      expect(response_json["message"]).to eq "Item has been added to your order"
    end

    it 'should respond with order_id' do
      expect(response_json["order"]).to have_key 'id'
    end

    it "should respond with order total" do
      expect(response_json["order"]["total"]).to eq 100
    end

    it "should respond with amount of products in the order" do
      expect(response_json["order"]["products"].count).to eq 1
    end

    it 'order should have correct product in it' do
      expect(Order.last.order_items.first["product_id"]).to eq hamburger.id 
    end
  end
end