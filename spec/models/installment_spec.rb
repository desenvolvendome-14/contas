require 'rails_helper'

RSpec.describe Installment, type: :model do
  describe 'associations' do
    it { expect(create(:installment)).to belong_to(:bill) }
    it { expect(create(:installment)).to belong_to(:account_bank) }
    it { expect(create(:installment)).to belong_to(:type_charge) }
  end
    
  describe 'validate' do
    context "presence true" do
      #   todo
     # it { expect(create(:installment)).to validate_presence_of(:description) }
    end
    
    context "positive value " do
      it 'value positive' do
        installment =  build(:installment, value: 0) 
        expect(installment.save).to  be_falsey
        expect(installment.errors[:value]).to include("Valor não pode ser menor ou igual a zero")
      end
    end

    context "verify date" do
      it 'date' do
        installment =  build(:installment, due_date: "2021-10-10") 
        expect(installment.save).to  be_falsey
        expect(installment.errors[:due_date]).to include("data vencimento não pode ser maior que data atual")
      end
    end
  end
end