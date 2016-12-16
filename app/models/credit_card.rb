class CreditCard < ApplicationRecord
  belongs_to :user
  validates :card_number, { length: { is: 16 },
                            presence: true,
                            uniqueness: true,
                            case_sensitive: false }
  validates :card_name, :expiration_date, :security_code, :user_id, presence: true
end
