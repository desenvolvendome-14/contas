require 'rails_helper'

RSpec.describe 'API::v1::Bills', type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::BillsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  before :each do
    create_list(:invoice_receivable, 2)
    create_list(:invoice_payable, 3)
    create_list(:expense_payable,4)
  end

  describe "GET /index" do
    it "invoice_receivable" do
      get api_v1_bills_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_bill_url(Bill.first), as: :json
      expect(response).to be_successful
      expect(body_json.id).to eq(Bill.first)
      expect(body_json.to_h.keys).to eq([:id, :bill_type, :company_id, :invoice, :type_invoice, :issuance_date,
                                         :invoice_value, :increase, :scanning_date, :description, :account_plan_id,
                                         :cost_center_id, :discount, :net_value, :salesman_id, :commission,
                                         :created_at, :updated_at, :url])
    end
  end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Api::V1::Bill" do
  #       expect {
  #         post api_v1_bills_url,
  #              params: { api/v1_bill: valid_attributes }, headers: valid_headers, as: :json
  #       }.to change(Api::V1::Bill, :count).by(1)
  #     end
  #
  #     it "renders a JSON response with the new api/v1_bill" do
  #       post api_v1_bills_url,
  #            params: { api/v1_bill: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new Api::V1::Bill" do
  #       expect {
  #         post api_v1_bills_url,
  #              params: { api/v1_bill: invalid_attributes }, as: :json
  #       }.to change(Api::V1::Bill, :count).by(0)
  #     end
  #
  #     it "renders a JSON response with errors for the new api/v1_bill" do
  #       post api_v1_bills_url,
  #            params: { api/v1_bill: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json")
  #     end
  #   end
  # end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_bill" do
      bill = create(:expense_payable)
      expect {
        delete api_v1_bill_url(bill), headers: valid_headers, as: :json
      }.to change(Bill, :count).by(-1)
    end
  end
end
