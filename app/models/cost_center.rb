class CostCenter < ApplicationRecord
  validates :description, presence: true
end
