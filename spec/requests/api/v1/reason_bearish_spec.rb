require "rails_helper"

RSpec.describe "api/v1/reason_bearish", type: :request do
  before :each do
    create_list(:reason_bearish, 2)
  end

  describe "GET /index" do
    it "renders total Reason Bearish" do
      get api_v1_reason_bearishes_url, as: :json
      expect(body_json.count).to eq(2)
    end
    it "renders the Reason Bearish json keys" do
      get api_v1_reason_bearishes_url, as: :json
      expect(body_json.first.to_h.keys).to eq(%i[id description])
    end
  end
end
