# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::BillsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/bills").to route_to("api/v1/bills#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/bills/1").to route_to("api/v1/bills#show", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/bills/1").to route_to("api/v1/bills#destroy", id: "1")
    end
  end
end
