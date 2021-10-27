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
FactoryBot.define do
  factory :account_plan do
    description { "MyString" }
  end
end
