require "rails_helper"

RSpec.describe Api::V1::InstallmentsController, type: :routing do
  describe "routing" do
    it "POST #create" do
      expect(post: "/api/v1/installments").to route_to("api/v1/installments#create")
    end
  end
end
