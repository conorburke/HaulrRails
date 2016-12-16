class Ride < ApplicationRecord
  # Associations:
  belongs_to :rider, class_name: :User
  belongs_to :driver, class_name: :User

  STATUS_LIST = %w(contacting waiting riding complete)

  validates :rider, presence: true
  validates :status, inclusion: { in: STATUS_LIST, message: "%{value} is not a valid status" }
  validates :driver_score, :rider_score, numericality: { only_integer: true,
                                                         greater_than_or_equal_to: 1,
                                                         less_than_or_equal_to: 5 }

end
