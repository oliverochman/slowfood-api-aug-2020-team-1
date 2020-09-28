class Api::V2::CrimeReportsController < ApplicationController
  def index
    response = RestClient.get("https://brottsplatskartan.se/api/events/?location=#{params[:q]}")
    parsed_response = JSON.parse(response.body)
    
    if parsed_response["data"].empty?
      render json: { error_message: "No search results"}, status: 401
    else 
      render json: { crime_reports: parsed_response["data"] }
    end
  end
end
