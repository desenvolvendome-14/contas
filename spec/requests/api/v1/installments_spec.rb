require "rails_helper"

RSpec.describe "/api/v1/installments", type: :request do
  let(:bill) { create(:invoice_payable) }
  let(:installment) { create(:installment, bill: bill) }

  let(:payable_valid_attributes) { build(:installment).attributes }
  let(:receivable_valid_attributes) { build(:installment, :installment_receivable).attributes }

  let(:invalid_attributes) do
    {
      bill: "",
      account_bank: "",
      type_charge: "",
      due_date: ""
    }
  end

  describe "GET /index" do
    before do
      create_list(:installment, 3, bill: bill)
    end

    context "get all by Bill" do
      it "Status successful" do
        get "/api/v1/installments?bill_id=#{bill.id}", as: :json

        expect(response).to be_successful
      end

      it "return all installment" do
        get "/api/v1/installments?bill_id=#{bill.id}", as: :json

        expect(body_json.count).to eq 3
      end
    end
  end

  describe "GET /show" do
    context "get installment by Bill" do
      it "Status successful" do
        get "/api/v1/installments/#{installment.id}?bill_id=#{bill.id}", as: :json

        expect(response).to be_successful
      end

      it "return all installment" do
        get "/api/v1/installments/#{installment.id}?bill_id=#{bill.id}", as: :json

        expect(body_json.installment.to_h.keys).to eq(%i[id name note value due_date
                                                    discount discount_due_date notary_title
                                                    notary_value send_date protested_title
                                                    protest_date protest_value bank_remittance])
      end
    end
  end

  describe "POST /create Payable" do
    context "with valid parameters" do
      it "creates a new Api::V1::Installment" do
        expect do
          post api_v1_installments_url,
               params: { installment: payable_valid_attributes }, as: :json
        end.to change(Installment, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_installment" do
        post api_v1_installments_url,
             params: { installment: payable_valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Api::V1::Installment" do
        expect do
          post api_v1_installments_url,
               params: { installment: invalid_attributes }, as: :json
        end.to change(Installment, :count).by(0)
      end

      it "renders a JSON response with errors for the new api/v1_installment" do
        post api_v1_installments_url,
             params: { installment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "POST /create Receivable" do
    context "with valid parameters" do
      it "creates a new Api::V1::Installment" do
        expect do
          post api_v1_installments_url,
               params: { installment: receivable_valid_attributes }, as: :json
        end.to change(Installment, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_installment" do
        post api_v1_installments_url,
             params: { installment: receivable_valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Api::V1::Installment" do
        expect do
          post api_v1_installments_url,
               params: { installment: invalid_attributes }, as: :json
        end.to change(Installment, :count).by(0)
      end

      it "renders a JSON response with errors for the new api/v1_installment" do
        post api_v1_installments_url,
             params: { installment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end
end
