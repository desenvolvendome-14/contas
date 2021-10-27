require 'rails_helper'

RSpec.describe "/api/v1/payments", type: :request do
  let(:valid_attributes) { build(:payment).attributes }

  let(:invalid_attributes) do
    {
      bill: nil,
      installment: nil,
      amount_paid: 0
    }
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Payment" do
        expect {
          post api_v1_payments_url,
               params: { payment: valid_attributes }, as: :json
          response_body = response.body
        }.to change(Payment, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_payment" do
        post api_v1_payments_url,
             params: { payment: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Payment" do
        expect {
          post api_v1_payments_url,
               params: { payment: invalid_attributes }, as: :json
        }.to change(Payment, :count).by(0)
      end

      it "renders a JSON response with errors for the new payment" do
        post api_v1_payments_url,
             params: { payment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end