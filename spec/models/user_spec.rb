require 'rails_helper'

RSpec.describe User, type: :model do
    let(:driver) { User.create(
        first_name: "Conor",
        last_name: "Burke",
        email: "cjburke89@gmail.com",
        password_digest: "1234",
        phone: "717-608-8969",
        zipcode: "92102",
        status: "user",
        active_driver: 1
    )}

  describe "associations" do
    # it { should have_many(:credit_cards) }
    it { should have_many(:rides).with_foreign_key('rider_id') }
    it { should have_many(:cars).with_foreign_key('driver_id') }
    it { should have_many(:drives).class_name('Ride').with_foreign_key('driver_id') }
    it 'has one default car' do
      car = Car.create(driver_id: driver.id, make: "Toyota", model: "Tacoma", year: "2007", color: "red", approved: 1, default_car: 1)
      expect(driver.default_car).to eq car
    end
  end

  describe "validations" do
    subject { User.new( first_name: 'Jane',
                        last_name: 'Doe',
                        email: 'jdoe@gmail.com',
                        password: 'likesbikes',
                        phone: '760-434-4344',
                        zipcode: '93040',
                        status: "user",
                        active_driver: 0) }

    # subject { FactoryGirl.build(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:active_driver) }

    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should allow_values('760-434-4344').for(:phone) }
    it { should allow_values('760-454-4384').for(:phone) }
    it { should_not allow_values('1760-434-4344').for(:phone) }
    it { should_not allow_values('7x0-434-4344').for(:phone) }
    it { should_not allow_values('1760-434+4344').for(:phone) }
    it { should_not allow_values('1760-43444').for(:phone) }
    it { should_not allow_values('174').for(:phone) }

  end


end
