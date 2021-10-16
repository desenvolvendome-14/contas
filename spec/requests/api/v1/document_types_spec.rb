require "rails_helper"

RSpec.describe "/api/v1/document_types", type: :request do
  before :each do
    create_list(:document_type, 2)
  end

  describe "GET /index" do
    it "renders total Document Types" do
      get api_v1_document_types_url, as: :json
      expect(body_json.count).to eq(2)
    end

    it "renders the Document Types json keys" do
      get api_v1_document_types_url, as: :json
      expect(body_json.first.to_h.keys).to eq(%i[id description])
    end
  end
end
