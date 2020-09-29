class Api::V2::JokesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_user_subscriber?

  def create
    joke = current_user.jokes.create(joke_params)

    if joke.persisted?
      render json: { message: "Successfully saved joke"}
    else
      render json: { error_message: "Something went wrong"}, status: 400
    end
  end

  private

  def is_user_subscriber?
    unless current_user.subscriber
      render json: { error_message: "You need to become subscriber in order to save a joke"}, status: 401
      return
    end
  end

  def joke_params
    params.permit(:joke3_id, :content)
  end
end
