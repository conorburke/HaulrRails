require 'rails_helper'

RSpec.describe Ride, type: :model do

  it { should belong_to(:rider) }
  it { should belong_to(:driver) }

  describe "Validations" do
    it { should validate_presence_of(:rider) }
    it { should validate_inclusion_of(:status).in_array(["contacting", "waiting", "riding", "complete"])}
    it { should validate_numericality_of(:driver_score).only_integer }
    it { should validate_numericality_of(:driver_score).is_less_than_or_equal_to(5) }
    it { should validate_numericality_of(:driver_score).is_greater_than_or_equal_to(1) }
    it { should validate_numericality_of(:rider_score).only_integer }
    it { should validate_numericality_of(:rider_score).is_less_than_or_equal_to(5) }
    it { should validate_numericality_of(:rider_score).is_greater_than_or_equal_to(1) }
  end
end
