RSpec.describe 'GET /api/v1/products', type: :request do
  let!(:products) { 3.times { create(:product) } }

	before do
		get '/api/v1/products'
	end

	it 'should return a 200 response' do
		expect(response).to have_http_status 200
	end

	it 'should return a list of menu items' do
		expect(response_json["products"].length).to eq 3
	end

	it 'should return items with a name' do
		expect(response_json["products"][0]).to have_key('name')
	end

	it 'should return items with a price' do
		expect(response_json["products"][0]).to have_key('price')
	end

	it 'should return items with a category' do
		expect(response_json["products"][0]).to have_key('category')
	end
end
