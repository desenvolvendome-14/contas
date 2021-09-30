class Rateio < ApplicationRecord
  belongs_to :account_plan
  belongs_to :cost_center
  belongs_to :bill

  validates :code, :story, presence: true
  validates :account_plan_id, :cost_center_id, :bill, presence: true
  validates :value, presence: true

  belongs_to :bio_id
  belongs_to :invoice
end
