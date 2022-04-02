require "rails_helper"

RSpec.describe "api/v1/account_bank", type: :request do
  before do
    create_list(:account_bank, 2)
  end

  describe "GET /index" do
    it "renders total Account Bank" do
      get api_v1_account_banks_url, as: :json
      expect(body_json.count).to eq(2)
    end

    it "renders the Account Bank json keys" do
      get api_v1_account_banks_url, as: :json
      expect(body_json.first.to_h.keys).to eq(%i[id description])
    end
  end
end
