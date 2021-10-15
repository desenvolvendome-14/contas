# frozen_string_literal: true

# == Schema Information
#
# Table name: account_plans
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe Company, type: :model do
  describe "validations " do
    it { should validate_presence_of(:name) }
  end

  describe "::Associations" do
    it { should have_many(:bills) }
  end
end
