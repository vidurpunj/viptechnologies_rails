class Api::SignupController < ApplicationController
  skip_before_action :verify_authenticity_token

  def register
    user = User.new
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.phone = params[:phone]
    user.password = params[:password]
    user.password_confirmation = params[:confirmation_password]
    user.gender = params[:gender]
    user.country = params[:country]
    user.terms_and_condition = params[:terms_and_condition]
    if user.save
      render json: { message: "User created successfully", status: 200 } and return
    else
      render json: { message: user.errors.full_messages, status: 500, error: 'This Email already exists.' } and return
    end
  end

  def login
    user = User.find_by_email(params[:email])
    if user&.valid_password?(params[:password])
      payload = params[:email]
      token = encode_token(payload)
      render json: {
        status: "success",
        code: 200,
        "message": "Password matches. You are now logged in.",
        "access_token": token
      }
    else
      render json: {
        status: "error",
        code: 200,
        "message": "Email & Password do not match."
      }
    end
  end
end
