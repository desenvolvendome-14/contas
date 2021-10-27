require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe "Associations" do
    it { should belong_to(:bill) }
    it { should belong_to(:reason_bearish) }
    it { should belong_to(:installment) }
    it { should belong_to(:document_type) }
    it { should belong_to(:account_bank) }
    it { should belong_to(:charts_accounts_amount_paid).class_name("ChartsAccount").required }
    it { should belong_to(:charts_accounts_discount_amount).class_name("ChartsAccount") }
    it { should belong_to(:charts_accounts_interest_amount).class_name("ChartsAccount") }
    it { should belong_to(:charts_accounts_increase_amount).class_name("ChartsAccount") }
  end

  describe "total_amount calculate before save" do
    let!(:payment) { create(:payment, amount_paid: 100, discount_amount: 10,
                            interest_amount: 0, increase_amount: 0) }

    it { expect(payment.total_amount).to eq(90) }
  end
end
