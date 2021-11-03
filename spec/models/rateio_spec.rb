require 'rails_helper'

RSpec.describe Rateio, type: :model do
  describe "General" do
    context "::Validations" do
      it { is_expected.to validate_presence_of :value_rateio }
    end

  end
end
