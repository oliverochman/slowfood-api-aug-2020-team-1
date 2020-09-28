class Api::V2::CrimeReportsController < ApplicationController
  def index
    response = RestClient.get("https://brottsplatskartan.se/api/events/?location=#{params[:q]}")
    parsed_response = JSON.parse(response.body)

    render json: { crime_reports: parsed_response["data"] }
  end
end
