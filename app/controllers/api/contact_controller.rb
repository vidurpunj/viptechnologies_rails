class Api::ContactController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    contact_us = ContactUsForm.new
    contact_us.first_name = params['firstName']
    contact_us.last_name = params['lastName']
    contact_us.email = params['email']
    contact_us.phone = params['phone']
    contact_us.service = params['service']
    contact_us.subject = params['subject']
    contact_us.message = params['message']
    contact_us.save
    render json: { message: "Thank you for reaching out! Your message has been received, and our team will get back to you shortly. We appreciate your interest and look forward to assisting you.", status: 200 } and return
  end
end
