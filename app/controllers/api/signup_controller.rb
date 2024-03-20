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
      if user.save(validate: false)
        render json: { message: "User created successfully", status: :ok }
      else
        render json: { message: "User not created", status: 500, error: 'This Email already exists.' }
      end
  end
end
