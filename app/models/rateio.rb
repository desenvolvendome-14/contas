class Rateio < ApplicationRecord
  belongs_to :account_plan
  belongs_to :cost_center
  belongs_to :bio_id
  belongs_to :invoice
end
