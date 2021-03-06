# frozen_string_literal: true

# == Schema Information
#
# Table name: bills
#
#  id              :bigint           not null, primary key
#  bill_type       :integer
#  commission      :float
#  description     :string
#  discount        :float
#  increase        :float
#  invoice         :string
#  invoice_value   :float
#  issuance_date   :date
#  net_value       :float
#  scanning_date   :date
#  type_invoice    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_plan_id :integer
#  company_id      :integer
#  cost_center_id  :integer
#  participant_id  :integer
#  salesman_id     :integer
#
FactoryBot.define do
  factory :bill do
    company { create(:company) }
    invoice { "MyString" }
    type_invoice { 1 }
    issuance_date { "2021-09-15" }
    invoice_value { 1.5 }
    increase { 1.5 }
    net_value { 5.9 }

    trait :invoice_receivable do
      bill_type { "invoice_receivable" }
      salesman { create(:type_salesman) }
      commission { 1.5 }
    end

    trait :invoice_payable do
      bill_type { "invoice_payable" }
      scanning_date { Date.today }
      description { "MyString" }
      chart_accounts { create(:chart_accounts) }
      cost_center { create(:cost_center) }
      discount { 1.5 }
    end

    trait :expense_payable do
      bill_type { "expense_payable" }
      scanning_date { Date.today }
      description { "MyString" }
      chart_accounts { create(:chart_accounts) }
      cost_center { create(:cost_center) }
      discount { 1.5 }
    end

    factory :expense_payable, traits: [:expense_payable]
    factory :invoice_payable, traits: [:invoice_payable]
    factory :invoice_receivable, traits: [:invoice_receivable]
  end
end
