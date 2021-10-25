# == Schema Information
#
# Table name: account_plans
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ChartsAccount < ApplicationRecord
  has_many :bills
end