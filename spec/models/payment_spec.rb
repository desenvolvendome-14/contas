require "rails_helper"

RSpec.describe Payment, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:bill) }
    it { is_expected.to belong_to(:reason_bearish) }
    it { is_expected.to belong_to(:installment) }
    it { is_expected.to belong_to(:document_type) }
    it { is_expected.to belong_to(:account_bank) }
    it { is_expected.to belong_to(:charts_accounts_amount_paid).class_name("ChartAccounts").required }
    it { is_expected.to belong_to(:charts_accounts_discount_amount).class_name("ChartAccounts") }
    it { is_expected.to belong_to(:charts_accounts_interest_amount).class_name("ChartAccounts") }
    it { is_expected.to belong_to(:charts_accounts_increase_amount).class_name("ChartAccounts") }
    it { is_expected.to belong_to(:charts_accounts_notary_value).class_name("ChartAccounts").optional }
    it { is_expected.to belong_to(:charts_accounts_protest_value).class_name("ChartAccounts").optional }
  end

  describe "Validations" do
    context "greater than or equal to zero" do
      it "Amount Paid" do
        expect(subject).to validate_numericality_of(:amount_paid).is_greater_than_or_equal_to(0)
      end

      it "Discount Amount" do
        expect(subject).to validate_numericality_of(:discount_amount).is_greater_than_or_equal_to(0)
      end

      it "Interest Amount" do
        expect(subject).to validate_numericality_of(:interest_amount).is_greater_than_or_equal_to(0)
      end

      it "Increase Amount" do
        expect(subject).to validate_numericality_of(:increase_amount).is_greater_than_or_equal_to(0)
      end
    end

    context "Validates date less than today" do
      let!(:payment) do
        build(:payment,
              pay_date: Date.today + 1.day,
              accounting_date: Date.today + 1.day)
      end

      it "Pay Date" do
        expect(payment.save).to be_falsey
        expect(payment.errors[:pay_date]).to include("Data de Pagamento não pode ser maior que data atual")
      end

      it "Accounting Date" do
        expect(payment.save).to be_falsey
        expect(payment.errors[:accounting_date]).to include("Data Contábil não pode ser maior que data atual")
      end
    end
  end

  describe "total_amount calculate before save" do
    let!(:payment) do
      create(:payment, amount_paid: 100, discount_amount: 10,
                       interest_amount: 0, increase_amount: 0)
    end

    it { expect(payment.total_amount).to eq(90) }
  end
end
