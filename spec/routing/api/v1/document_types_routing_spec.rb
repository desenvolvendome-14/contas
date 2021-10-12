require "rails_helper"

RSpec.describe Api::V1::DocumentTypesController, type: :routing do
  describe "routing" do
    it "GET #index" do
      expect(get: "/api/v1/document_types").to route_to("api/v1/document_types#index")
    end
  end
end
