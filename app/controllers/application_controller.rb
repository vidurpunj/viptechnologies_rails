class ApplicationController < ActionController::Base
  private

  def encode_token(payload)
    JWT.encode(payload, 'your_secret_key_here')
  end
end
