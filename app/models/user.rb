class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
  def self.ransackable_attributes(auth_object = nil)
    # List the attributes you want to allow for searching
    # Exclude sensitive attributes like 'encrypted_password', 'password_reset_token', etc.
    ["created_at", "email", "id", "remember_created_at", "reset_password_sent_at", "updated_at"]
  end
end
