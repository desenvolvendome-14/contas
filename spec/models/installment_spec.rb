require "rails_helper"

RSpec.describe Installment, type: :model do
  describe "associations" do
    it { expect(create(:installment)).to belong_to(:bill) }
    it { expect(create(:installment)).to belong_to(:account_bank) }
    it { expect(create(:installment)).to belong_to(:type_charge) }
  end

  describe "validate" do
    context "presence true" do
      #   todo
      it { expect(create(:installment)).to validate_presence_of(:due_date) }
    end

    context "positive value " do
      it "value positive" do
        installment = build(:installment, value: 0)
        expect(installment.save).to be_falsey
        expect(installment.errors[:value]).to include("Valor não pode ser menor ou igual a zero")
      end
    end

    context "verify date" do
      it "date" do
        installment = build(:installment, due_date: "2021-10-10")
        expect(installment.save).to be_falsey
        expect(installment.errors[:due_date]).to include("data vencimento não pode ser maior que data atual")
      end
    end

    context "verify send date" do
      it "send date" do
        installment = build(:installment, :installment_receivable, send_date: "2021-10-10")
        expect(installment.save).to be_falsey
        expect(installment.errors[:send_date]).to include("data de envio não pode ser maior que data atual")
      end
    end

    context "verify protest_date" do
      it "protest date" do
        installment = build(:installment, :installment_receivable, protest_date: "2020-10-10")
        expect(installment.save).to be_falsey
        expect(installment.errors[:protest_date]).to include("data do protesto não pode ser maior que data atual")
      end
    end

    context "verify value discount" do
      it "value negative" do
        installment = build(:installment, :installment_receivable, discount: -1)
        expect(installment.save).to be_falsey
        expect(installment.errors[:discount]).to include("Valor do Desconto não pode ser menor que zero")
      end
    end

    context "verify notary value" do
      it "value negative" do
        installment = build(:installment, :installment_receivable, notary_value: -2)
        expect(installment.save).to be_falsey
        expect(installment.errors[:notary_value]).to include("Valor do Cartório não pode ser menor que zero")
      end
    end

    context "verify protest value" do
      it "value negative" do
        installment = build(:installment, :installment_receivable, protest_value: -2)
        expect(installment.save).to be_falsey
        expect(installment.errors[:protest_value]).to include("Valor do Protesto não pode ser menor que zero")
      end
    end
  end
end
