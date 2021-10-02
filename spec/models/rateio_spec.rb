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
require "rails_helper"

RSpec.describe Rateio, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :story }
    it { is_expected.to validate_presence_of :value }

  end

end
