RSpec.describe 'GET /api/v2/crime_reports', type: :request do
  before do
    get '/api/v2/crime_reports',
    params: {
      q: 'Visby'
    }
  end

  it 'is expected to return 200 response status' do
    expect(response.status).to eq 200
  end

  it 'is expected to return 10 crime reports' do
    expect(response_json["crime_reports"].count).to eq 10
  end

  it 'is expected to return specific crime report' do
    expect(response_json["crime_reports"].second["title_type"]).to eq "Narkotikabrott"
  end
end
