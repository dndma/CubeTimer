class User < ApplicationRecord
  validates :email, :encrypted_password, :presence => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
