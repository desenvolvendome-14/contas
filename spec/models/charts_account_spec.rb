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

RSpec.describe ChartsAccount, type: :model do
  describe "::Associations" do
    it { should have_many(:bills) }
  end
end
