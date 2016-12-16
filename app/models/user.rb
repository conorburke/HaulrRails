class User < ApplicationRecord
  # Associations:
  has_many :cars, foreign_key: :driver_id
  has_many :credit_cards
  has_many :rides, foreign_key: :rider_id
  has_many :drives, class_name: :Ride, foreign_key: :driver_id
  has_secure_password

  # Validations:
end
