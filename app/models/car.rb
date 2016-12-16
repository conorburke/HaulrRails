class Car < ApplicationRecord
  belongs_to :driver, class_name: :User

  has_attached_file :registration, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :registration, content_type: /\Aimage\/.*\z/

  has_attached_file :insurance, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :insurance, content_type: /\Aimage\/.*\z/

  validates :driver_id, :make, :model, :year, :color, presence: true

  validates :approved, :default_car, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
end