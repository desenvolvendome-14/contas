class Rateio < ApplicationRecord
  validates :code, :account_plan, :cost_center, :story, :value, presence: true

end
