class Car < ApplicationRecord
  belongs_to :driver, class_name: :User

  validates :driver_id, :make, :model, :year, :color, presence: true

  validates :approved, :default_car, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
end
