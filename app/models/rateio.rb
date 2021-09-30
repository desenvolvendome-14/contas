class Rateio < ApplicationRecord
  belongs_to :account_plan
  belongs_to :cost_center
end
