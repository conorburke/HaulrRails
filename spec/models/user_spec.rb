require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:credit_cards) }
  it { should have_many(:rides).with_foreign_key('rider_id') }
  it { should have_many(:cars).with_foreign_key('driver_id') }
  it { should have_many(:drives).class_name('Ride').with_foreign_key('driver_id') }

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
