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
FactoryBot.define do
  factory :cost_center do
    description { "MyString" }
  end
end
