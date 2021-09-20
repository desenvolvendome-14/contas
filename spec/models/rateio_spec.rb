require 'rails_helper'

RSpec.describe Rateio, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :account_plan }
    it { is_expected.to validate_presence_of :cost_center }
    it { is_expected.to validate_presence_of :value }
    it { is_expected.to validade_presence_of :story }
  end
end
