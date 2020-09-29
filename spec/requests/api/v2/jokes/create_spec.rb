RSpec.describe 'POST /api/v2/jokes', type: :request do
  let(:subscriber) { create(:user, subscriber: true) }
  let(:credentials) { subscriber.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json'}.merge!(credentials) }

  describe 'successfully' do
    before do
      post '/api/v2/jokes',
      params: {
        joke3_id: 'zesxrdtcfvygubhinjomk',
        content: 'This is a joke hahahah'
      },
      headers: headers
    end

    it 'is expected to return 200 response status' do 
      expect(response.status).to eq 200
    end

    it 'is expected to return success message' do 
      expect(response_json["message"]).to eq "Successfully saved joke"
    end
  end
end
