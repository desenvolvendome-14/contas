# frozen_string_literal: true

# == Schema Information
#
# Table name: reason_bearishes
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe ReasonBearish, type: :model do
  describe "validations " do
    it { is_expected.to validate_presence_of(:description) }
  end
end
