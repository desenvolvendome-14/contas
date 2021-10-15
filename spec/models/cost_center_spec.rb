# frozen_string_literal: true

# == Schema Information
#
# Table name: cost_centers
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe CostCenter, type: :model do
  describe "::Associations" do
    it { should have_many(:bills) }
  end
end
