class Rateio < ApplicationRecord
  validates :code, :account_plan, :cost_center, :value, presence: true

end
