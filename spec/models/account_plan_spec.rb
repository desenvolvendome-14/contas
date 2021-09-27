require 'rails_helper'

RSpec.describe AccountPlan, type: :model do

  describe "validations Accont_Plan" do
    it { is_expected.to validate_presence_of :description }
  end
end
