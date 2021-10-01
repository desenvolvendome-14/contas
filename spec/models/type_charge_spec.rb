# frozen_string_literal: true

require "rails_helper"

RSpec.describe TypeCharge, type: :model do
  describe "validations " do
    it { should validate_presence_of(:description) }
  end
end
