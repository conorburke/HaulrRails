class CreditCard < ApplicationRecord
  belongs_to :user
  validates :card_number, { length: { is: 19 },
                            presence: true,
                            uniqueness: true,
                            case_sensitive: false }
  validates :card_name, :expiration_date, :security_code, :user_id, presence: true

  validate :card_number_has_correct_format

  def card_number_has_correct_format
    unless self.card_number =~ /^\d{4}-\d{4}-\d{4}-\d{4}$/ # Ex: "1234-1234-1234-1234"
      errors.add :card_number, "must be formatted correctly"
    end
  end
end
