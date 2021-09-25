# frozen_string_literal: true

require "rails_helper"

RSpec.describe Bill, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :bill_type }
    it { is_expected.to validate_presence_of :company_id }
    it { is_expected.to validate_presence_of :invoice }
    it { is_expected.to validate_presence_of :type_invoice }
    it { is_expected.to validate_presence_of :issuance_date }
    it { is_expected.to validate_presence_of :invoice_value }
    it { is_expected.to validate_presence_of :increase }
  end

  describe "validations for :invoice_receivable" do
    before do
      @invoice_receivable = create(:invoice_receivable)
    end

    it { expect(@invoice_receivable).to validate_presence_of(:salesman_id) }
    it { expect(@invoice_receivable).to validate_presence_of(:commission) }
  end

  describe "validations for :invoice_payable" do
    before do
      @invoice_payable = create(:invoice_payable)
    end

    it { expect(@invoice_payable).to validate_presence_of(:scanning_date) }
    it { expect(@invoice_payable).to validate_presence_of(:description) }
    it { expect(@invoice_payable).to validate_presence_of(:account_plan_id) }
    it { expect(@invoice_payable).to validate_presence_of(:cost_center_id) }
    it { expect(@invoice_payable).to validate_presence_of(:discount) }
    it { expect(@invoice_payable).to validate_presence_of(:net_value) }
  end

  describe "validations for :expense_payable" do
    before do
      @expense_payable = create(:expense_payable)
    end

    it { expect(@expense_payable).to validate_presence_of(:scanning_date) }
    it { expect(@expense_payable).to validate_presence_of(:description) }
    it { expect(@expense_payable).to validate_presence_of(:account_plan_id) }
    it { expect(@expense_payable).to validate_presence_of(:cost_center_id) }
    it { expect(@expense_payable).to validate_presence_of(:discount) }
    it { expect(@expense_payable).to validate_presence_of(:net_value) }
  end
end
