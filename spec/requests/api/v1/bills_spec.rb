require "rails_helper"

RSpec.describe "API::v1::Bills", type: :request do
  let(:invoice_receivable_valid_attributes) { build(:invoice_receivable).attributes }
  let(:invoice_payable_valid_attributes) { build(:invoice_payable).attributes }
  let(:expense_payable_valid_attributes) { build(:expense_payable).attributes }

  let(:invalid_attributes) do
    { bill_type: nil }
  end

  describe "GET /index" do
    before do
      create_list(:invoice_receivable, 2)
      create_list(:invoice_payable, 3)
      create_list(:expense_payable, 4)
    end

    it "get All" do
      get api_v1_bills_url, as: :json
      expect(body_json.bills.count).to eq(9)
    end

    it "invoice_receivable" do
      get "/api/v1/bills?bill_type=invoice_receivable", as: :json
      expect(body_json.count).to eq(2)
    end

    it "invoice_payable" do
      get "/api/v1/bills?bill_type=invoice_payable", as: :json
      expect(body_json.count).to eq(3)
    end

    it "expense_payable" do
      get "/api/v1/bills?bill_type=expense_payable", as: :json
      expect(body_json.count).to eq(4)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      create_list(:invoice_receivable, 2)
      get api_v1_bill_url(Bill.first), as: :json
      expect(body_json.to_h.keys).to eq(%i[id bill_type company_id invoice type_invoice issuance_date
                                           invoice_value increase scanning_date description chart_accounts_id
                                           cost_center_id discount net_value salesman_id commission
                                           created_at updated_at url])
    end
  end

  describe "POST /create_receivable" do
    context "when ::Invoice Receivable" do
      it "creates a new" do
        expect do
          post create_receivable_api_v1_bills_url,
               params: { bill: invoice_receivable_valid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :invoice_receivable), :count).by(1)
      end

      it "not creates a new with invalid_params" do
        expect do
          post create_receivable_api_v1_bills_url,
               params: { bill: invalid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :invoice_receivable), :count).by(0)
      end
    end
  end

  describe "POST /create_payable" do
    context "when ::invoice_payable" do
      it "creates a new" do
        expect do
          post create_payable_api_v1_bills_url,
               params: { bill: invoice_payable_valid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :invoice_payable), :count).by(1)
      end

      it "not creates a new with invalid_params" do
        expect do
          post create_payable_api_v1_bills_url,
               params: { bill: invalid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :invoice_payable), :count).by(0)
      end
    end

    context "when ::expense_payable" do
      it "creates a new" do
        expect do
          post create_payable_api_v1_bills_url,
               params: { bill: expense_payable_valid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :expense_payable), :count).by(1)
      end

      it "not creates a new with invalid_params" do
        expect do
          post create_payable_api_v1_bills_url,
               params: { bill: invalid_attributes }, as: :json
        end.to change(Bill.where(bill_type: :expense_payable), :count).by(0)
      end
    end
  end

  describe "PUT /update_receivable/:id" do
    let(:invoice) { create(:invoice_receivable) }

    let(:new_params) do
      {
        "invoice_value": 340.0,
        "increase": "10.00"
      }
    end

    context "when attributes valid" do
      it "check if attributes was updated" do
        put update_receivable_api_v1_bills_url(invoice),
            params: { bill: new_params }, as: :json

        expect(body_json.increase).to eq(10)
      end
    end

    context "when attributes invalid" do
      it "not update when invalid attributes" do
        put update_receivable_api_v1_bills_url(invoice),
            params: { bill: invalid_attributes }, as: :json

        expect(body_json.bill_type).to include("can't be blank")
      end
    end
  end

  describe "PUT /update_payable/:id" do
    let(:invoice) { create(:invoice_payable) }

    let(:new_params) do
      {
        "invoice_value": 340.0,
        "increase": "10.00"
      }
    end

    context "when attributes valid" do
      it "check if attributes was updated" do
        put update_payable_api_v1_bills_url(invoice),
            params: { bill: new_params }, as: :json

        expect(body_json.invoice_value).to eq(340.0)
      end
    end

    context "when attributes invalid" do
      it "not update when invalid attributes" do
        put update_payable_api_v1_bills_url(invoice),
            params: { bill: invalid_attributes }, as: :json

        expect(body_json.bill_type).to include("can't be blank")
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
