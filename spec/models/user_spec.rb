require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:credit_cards) }
  it { should have_many(:rides).with_foreign_key('rider_id') }
  it { should have_many(:cars).with_foreign_key('driver_id') }
  it { should have_many(:drives).class_name('Ride').with_foreign_key('driver_id') }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:active_driver) }

  it { should validate_uniqueness_of(:email).case_insensitive }



end
