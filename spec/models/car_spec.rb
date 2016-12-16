require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:driver) {User.create(first_name: "Conor", last_name: "Burke", email: "cjburke89@gmail.com", password_digest: "1234", phone: "717-608-8969", zipcode: "92102", status: "driver", active_driver: 1 )}
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
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
