require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'credit card is valid' do
    creditcard = CreditCard.new(user_id: 1,
                                card_number: "1234123412341234",
                                card_name: "Chase",
                                expiration_date: "01-2018",
                                security_code: "123")

    it 'has a number' do
      expect(creditcard).to have_attributes(card_number: "1234123412341234")
    end

    it 'has a name' do
      expect(creditcard).to have_attributes(card_name: "Chase")
    end

    it 'has an expiration date' do
      expect(creditcard).to have_attributes(expiration_date: "01-2018")
    end

    it 'has a security code' do
      expect(creditcard).to have_attributes(security_code: "123")
    end

    it 'is an approved card' do
      expect(creditcard).to have_attributes(approved: 0)
    end

    it 'is the default card' do
      expect(creditcard).to have_attributes(default_card: 0)
    end

  end

  context 'active record' do
    context 'validations' do
      subject { CreditCard.new(user_id: 1,
                                card_number: "1234123412341234",
                                card_name: "Chase",
                                expiration_date: "01-2018",
                                security_code: "123") }
      it { should validate_presence_of(:card_number) }
      it { should validate_uniqueness_of(:card_number).ignoring_case_sensitivity }
      it { should validate_length_of(:card_number).is_equal_to(16) }

      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:card_name) }
      it { should validate_presence_of(:expiration_date) }
      it { should validate_presence_of(:security_code) }
      end
    context 'associations' do
      it { should belong_to(:user) }
    end
  end

end
