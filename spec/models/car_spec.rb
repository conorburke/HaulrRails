require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:driver) {User.create(first_name: "Conor", last_name: "Burke", email: "cjburke89@gmail.com", password_digest: "1234", phone: "717-608-8969", zipcode: "92102", status: "user", active_driver: 1 )}
  let(:car) {Car.create(driver_id: driver.id, make: "Toyota", model: "Tacoma", year: "2007", color: "red")}

  describe 'associations' do
    it { should belong_to(:driver) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:driver_id) }
    it { is_expected.to validate_presence_of(:make) }
    it { is_expected.to validate_presence_of(:model) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:color) }
    it { expect(car.approved).to be_kind_of(Integer)}
    it { expect(car.default_car).to be_kind_of(Integer)}
    it { expect(car.approved).to be >= 0}
    it { expect(car.default_car).to be >= 0}
    it 'is INVALID if it sets default to unapproved car' do
      invalid_car = Car.new(driver_id: driver.id, make: "Toyota", model: "Tacoma", year: "2007", color: "red", approved: 0, default_car: 1)
      expect(invalid_car).to_not be_valid
    end
    it 'is INVALID if it sets multiple default cars' do
      valid_car = car
      valid_car.make_default
      invalid_car = Car.new(driver_id: driver.id, make: "Toyota", model: "Tacoma", year: "2007", color: "red", default_car: 1)
      expect(invalid_car).to_not be_valid
    end
  end
  describe 'paperclip tests' do
    it { should have_attached_file(:registration) }
    it { should have_attached_file(:insurance) }
    it { should validate_attachment_content_type(:registration).
                  allowing('image/png', 'image/gif').
                  rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_content_type(:insurance).
                  allowing('image/png', 'image/gif').
                  rejecting('text/plain', 'text/xml') }
    # it { should validate_attachment_presence(:registration) }
    # it { should validate_attachment_size(:avatar).
    #               less_than(2.megabytes) }
  end

  describe 'feature methods' do
    let(:car2) {Car.create(driver_id: driver.id, make: "Toyota", model: "Tacoma", year: "2007", color: "red")}
    context "#make_default" do
      it 'sets current car as default car' do
        car2.make_default
        expect(car2.default_car).to eq 1
      end

      it 'removes default status of other cars' do
        car2.make_default
        expect(car.default_car).to eq 0
      end
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
