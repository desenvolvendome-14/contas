require 'rails_helper'

RSpec.describe Installment, type: :model do
  describe 'associations' do
    it { should belong_to(:bill) }
    it { should belong_to(:account_bank) }
    it { should belong_to(:type_charge) }
  end
end