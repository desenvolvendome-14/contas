require 'rails_helper'

RSpec.describe CostCenter, type: :model do
  describe "validations CostCenter" do
    it { is_expected.to validate_presence_of :description }
  end
end
