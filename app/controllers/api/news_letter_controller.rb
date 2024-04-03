class Api::NewsLetterController < ApplicationController
  skip_before_action :verify_authenticity_token
  def subscribe
    subscriber = NewsLetterSubscriber.find_by(email: params[:email])
    if subscriber.blank?
      subscriber = NewsLetterSubscriber.new
      subscriber.email = params[:email]

      if subscriber.save
        render json: { message: "congratulations you are subscribed to our new letter.", status: 200 } and return
      end
    else
      render json: { message: "you have already subscribed to our new letter.", status: 200 } and return
    end
  end
end
