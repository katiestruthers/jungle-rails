class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, length: { minimum: 5 }

  def authenticate_with_credentials
    user = User.find_by_email(params[:email])
    user && user.authenticate(params[:password])
  end
end
