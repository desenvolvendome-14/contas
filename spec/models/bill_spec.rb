require 'rails_helper'

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
    let(:invoice_receivable) { create(:invoice_receivable) }

    # TODO
    # it { is_expected.to validate_presence_of :salesman_id }
  end

  describe "validations for :invoice_payable" do
    let(:invoice_payable) { create(:invoice_payable) }

    # TODO
    # it { is_expected.to validate_presence_of :salesman_id }
  end

  describe "validations for :expense_payable" do
    let(:expense_payable) { create(:expense_payable) }

    # TODO
    # it { is_expected.to validate_presence_of :salesman_id }
  end
end
