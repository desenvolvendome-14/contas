class CostCenter < ApplicationRecord
  has_many :bills
  validates :description, presence: true
end
