# == Schema Information
#
# Table name: cost_centers
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CostCenter < ApplicationRecord
  has_many :bills
  validates :description, presence: true
end
