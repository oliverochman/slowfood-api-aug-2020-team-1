class Api::V2::JokesController < ApplicationController
  before_action :authenticate_user!
  def create
    binding.pry
  end
end
