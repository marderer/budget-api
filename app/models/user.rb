class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  class << self
    def authenticate(email, password)
      user = User.find_for_authentication(email: email)
      user.try(:valid_password?, password) ? user : nil
    end
  end

  validates :email, presence: true
end
