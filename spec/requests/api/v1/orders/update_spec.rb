RSpec.describe 'PUT /api/v1/orders/:id', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json'}.merge!(credentials) }

  let(:hamburger) {
    create(:product, name: 'Hamburger', price: 100)
  }
  let(:order) { create(:order, user: user) }
  let!(:order_item) { create(:order_item, order: order, product: hamburger) }

  let(:pizza) {
    create(:product, name: 'Pizza', price: 200)
  } 

  describe 'successfully' do
    before do
      put "/api/v1/orders/#{order.id}",
      params: {
        product: pizza.id
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
      expect(response_json["order"]["total"]).to eq 300
    end

    it "should respond with amount of products in the order" do
      expect(response_json["order"]["products"].count).to eq 2
    end

    it 'order should have correct product in it' do
      expect(Order.last.order_items.last["product_id"]).to eq pizza.id 
    end
  end
end