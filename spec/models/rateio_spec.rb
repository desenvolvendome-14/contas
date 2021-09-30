require 'rails_helper'

RSpec.describe Rateio, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :story }
    it { is_expected.to validate_presence_of :value }

  end
end
