<<<<<<< HEAD
FactoryBot.define do
  factory :rateio do
    value_rateio { "9.99" }
    obs { "MyText" }
=======
# frozen_string_literal: true

# == Schema Information
#
# Table name: rateios
#
#  id              :bigint           not null, primary key
#  code            :string
#  story           :string
#  value           :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_plan_id :bigint           not null
#  bill_id         :bigint           not null
#  cost_center_id  :bigint           not null
#
# Indexes
#
#  index_rateios_on_account_plan_id  (account_plan_id)
#  index_rateios_on_bill_id          (bill_id)
#  index_rateios_on_cost_center_id   (cost_center_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_plan_id => account_plans.id)
#  fk_rails_...  (bill_id => bills.id)
#  fk_rails_...  (cost_center_id => cost_centers.id)
#
FactoryBot.define do
  factory :rateio do
    code { "MyString" }
    chart_accounts { create(:chart_accounts) }
    cost_center { create(:cost_center) }
    story { "MyString" }
    bill { create(:invoice_payable) }
    value { "9.99" }
>>>>>>> Feature/create rateio (#31)
  end
end
