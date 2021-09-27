# == Schema Information
#
# Table name: account_plans
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AccountPlan < ApplicationRecord
end

  validates :description, presence: true
end