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
FactoryBot.define do
  factory :reason_bearish do
    description { "MyString" }
  end
end
