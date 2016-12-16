require 'rails_helper'

RSpec.describe Ride, type: :model do

  it { should belong_to(:rider) }
  it { should belong_to(:driver) }

  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:rider) }
  it { is_expected.to validate_presence_of(:driver) }
end
