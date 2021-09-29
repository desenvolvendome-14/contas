# frozen_string_literal: true

require "rails_helper"

RSpec.describe AccountPlan, type: :model do
  describe "::Associations" do
    it { should have_many(:bills) }
  end
end
