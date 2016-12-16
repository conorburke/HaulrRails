class User < ApplicationRecord
  # Associations:
  has_secure_password
  has_many :credit_cards
  has_many :rides, foreign_key: :rider_id

  has_many :cars, foreign_key: :driver_id
  has_many :drives, class_name: :Ride, foreign_key: :driver_id

  # Validations:

  TYPES = %w(user admin)

  validates :first_name, :last_name, :email, :password_digest, :phone, :zipcode, :status, :active_driver, presence: true
  validates :email, uniqueness: true
  validates :status, inclusion: { in: TYPES, message: "%{value} is not a valid type" }
  validate :valid_phone
  validate :valid_zipcode

  def valid_phone
    unless self.phone =~ /^\d{3}-\d{3}-\d{4}$/ # Ex: "619-643-8612"
      errors.add :phone, "number must be valid"
    end
  end

  def valid_zipcode
    unless self.zipcode =~ /^\d{5}$/ # Ex: "91006"
      errors.add :zipcode, "must be valid"
    end
  end

  # Behaviors:

  # def valid_driver
  #   !!(self.cars.find { |car| car.approved? })
  # end

  # def rider_rating
  #   rating_count = self.rides.count
  #   rating_sum = self.rides.reduce(0) { |ride, sum| sum += ride.rider_rating }
  #   return rating_count == 0? 0 : (ratings_sum.to_f / rating_count).round(1)
  # end

  # def driver_rating
  #   rating_count = self.drives.count
  #   rating_sum = self.drives.reduce(0) { |drive, sum| sum += drive.driver_rating }
  #   return rating_count == 0? 0 : (ratings_sum.to_f / rating_count).round(1)
  # end
end
