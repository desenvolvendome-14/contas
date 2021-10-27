require "rails_helper"

RSpec.describe Api::V1::PaymentsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/api/v1/payments").to route_to("api/v1/payments#create")
    end
  end
end
