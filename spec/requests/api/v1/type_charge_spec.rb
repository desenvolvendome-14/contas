require "rails_helper"

RSpec.describe "Api::V1::TypeCharges", type: :request do
  before :each do
    create_list(:type_charge, 2)
  end

  describe "GET /index" do
    it "renders Type Charge" do
      get api_v1_type_charges_url, as: :json
      expect(body_json.count).to eq(2)
    end
    it "renders the Types charge json keys" do
      get api_v1_type_charges_url, as: :json
      expect(body_json.first.to_h.keys).to eq(%i[id description created_at updated_at url])
    end
  end
end
