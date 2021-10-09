# frozen_string_literal: true

require "rails_helper"

RSpec.describe Bill, type: :model do
  describe "General" do
    context "::Validations" do
      it { is_expected.to validate_presence_of :bill_type }
      it { is_expected.to validate_presence_of :invoice }
      it { is_expected.to validate_presence_of :type_invoice }
      it { is_expected.to validate_presence_of :issuance_date }
      it { is_expected.to validate_presence_of :invoice_value }
      it { is_expected.to validate_presence_of :increase }
      it { is_expected.to validate_presence_of(:net_value) }
    end

    context "::Associations" do
      it { should belong_to(:company) }
    end
  end

  describe ":invoice_receivable" do
    before do
      @invoice_receivable = create(:invoice_receivable)
    end

    context "::Validations" do
      it { expect(@invoice_receivable).to validate_presence_of(:commission) }
    end

    context "::Associations" do
      it { expect(@invoice_receivable).to belong_to(:salesman).class_name("Participant").optional }
    end
  end

  describe ":invoice_payable" do
    before do
      @invoice_payable = create(:invoice_payable)
    end

    context "::Validations" do
      it { expect(@invoice_payable).to validate_presence_of(:scanning_date) }
      it { expect(@invoice_payable).to validate_presence_of(:description) }
      it { expect(@invoice_payable).to validate_presence_of(:discount) }
    end

    context "::Associations" do
      it { expect(@invoice_payable).to belong_to(:account_plan).optional }
      it { expect(@invoice_payable).to belong_to(:cost_center).optional }
    end
  end

  describe ":expense_payable" do
    before do
      @expense_payable = create(:expense_payable)
    end

    context "::Validations" do
      it { expect(@expense_payable).to validate_presence_of(:scanning_date) }
      it { expect(@expense_payable).to validate_presence_of(:description) }
      it { expect(@expense_payable).to validate_presence_of(:discount) }
    end

    context "::Associations" do
      it { expect(@expense_payable).to belong_to(:account_plan).optional }
      it { expect(@expense_payable).to belong_to(:cost_center).optional }
    end
  end
end
