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
  validate :valid_phone
  validate :valid_zipcode

  def valid_phone
    unless self.phone =~ /^\d{3}-\d{3}-\d{4}$/
      errors.add :phone, "number must be valid"
    end
  end

  def valid_zipcode
    unless self.zipcode =~ /^\d{5}$/
      errors.add :zipcode, "must be valid"
    end
  end
end
