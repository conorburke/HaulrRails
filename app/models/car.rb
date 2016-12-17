class Car < ApplicationRecord
  belongs_to :driver, class_name: :User

  has_attached_file :registration, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :registration, content_type: /\Aimage\/.*\z/

  has_attached_file :insurance, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :insurance, content_type: /\Aimage\/.*\z/

  validates :driver_id, :make, :model, :year, :color, presence: true
  validates :approved, :default_car, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  validate :check_default

  def check_default
    if self.default_car == 1
      unless self.approved == 1
        return errors.add :default_car, "must be approved"
      end

      if self.driver.default_car
        errors.add :default_car, "already exists for this driver"
      end
    end
  end

  # Feature Methods:
  def make_default
    self.driver.cars.update_all(default_car: 0)
    self.update_attribute(:default_car, 1)
  end
end
