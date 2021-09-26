# frozen_string_literal: true

require "rails_helper"

RSpec.describe "API::v1::Bills", type: :request do
  let(:invoice_receivable_valid_attributes) { build(:invoice_receivable).attributes }
  let(:invoice_payable_valid_attributes) { build(:invoice_payable).attributes }
  let(:expense_payable_valid_attributes) { build(:expense_payable).attributes }

  let(:invalid_attributes) do
    { bill_type: nil }
  end

  describe "GET /index" do
    before :each do
      create_list(:invoice_receivable, 2)
      create_list(:invoice_payable, 3)
      create_list(:expense_payable, 4)
    end
    it "invoice_receivable" do
      get api_v1_bills_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      create_list(:invoice_receivable, 2)
      get api_v1_bill_url(Bill.first), as: :json
      expect(response).to be_successful
      expect(body_json.id).to eq(Bill.first.id)
      expect(body_json.to_h.keys).to eq(%i[id bill_type company_id invoice type_invoice issuance_date
                                           invoice_value increase scanning_date description account_plan_id
                                           cost_center_id discount net_value salesman_id commission
                                           created_at updated_at url])
    end
  end

  describe "POST /create_receivable" do
    context "::Invoice Receivable" do
      it "creates a new" do
        expect do
          post create_receivable_api_v1_bills_url,
               params: { bill: invoice_receivable_valid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :invoice_receivable), :count).by(1)

        expect(response).to have_http_status(:created)
      end

      it "not creates a new with invalid_params" do
        expect do
          post create_receivable_api_v1_bills_url,
               params: { bill: invalid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :invoice_receivable), :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "POST /create_payable" do
    context "::invoice_payable" do
      it "creates a new" do
        expect do
          post create_payable_api_v1_bills_url,
               params: { bill: invoice_payable_valid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :invoice_payable), :count).by(1)

        expect(response).to have_http_status(:created)
      end

      it "not creates a new with invalid_params" do
        expect do
          post create_payable_api_v1_bills_url,
               params: { bill: invalid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :invoice_payable), :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "::expense_payable" do
      it "creates a new" do
        expect do
          post create_payable_api_v1_bills_url,
               params: { bill: expense_payable_valid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :expense_payable), :count).by(1)

        expect(response).to have_http_status(:created)
      end

      it "not creates a new with invalid_params" do
        expect do
          post create_payable_api_v1_bills_url,
               params: { bill: invalid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :expense_payable), :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api/v1_bill" do
      bill = create(:expense_payable)
      expect do
        delete api_v1_bill_url(bill), as: :json
      end.to change(Bill, :count).by(-1)
    end
  end
end