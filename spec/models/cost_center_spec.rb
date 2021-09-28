require 'rails_helper'

RSpec.describe CostCenter, type: :model do
  describe "::Associations" do
    it { should have_many(:bills) }
  end
end
