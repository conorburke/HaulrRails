class User < ApplicationRecord
  # Associations:
  has_secure_password
  has_many :credit_cards
  has_many :rides, foreign_key: :rider_id

  has_many :cars, foreign_key: :driver_id
  has_many :drives, class_name: :Ride, foreign_key: :driver_id

  # Validations:

  TYPES = %w(user admin)

  validates :first_name, :last_name, :email, :password_digest, :phone, :zipcode, presence: true
  validates :email, uniqueness: true
  validates :status, inclusion: { in: TYPES, message: "%{value} is not a valid type" }

  before_validation :set_status, on: :create

  def set_type
    self.type ||= "user"
  end
end
