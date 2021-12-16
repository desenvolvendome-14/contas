require "rails_helper"

RSpec.describe "/api/v1/payments", type: :request do
  let(:payment) { create(:payment) }

  let(:payable_valid_attributes) { build(:payment).attributes }
  let(:receivable_valid_attributes) { build(:payment, :invoice_receivable).attributes }

  let(:invalid_attributes) do
    {
      bill: nil,
      installment: nil,
      amount_paid: 0,
      pay_date: Date.tomorrow
    }
  end

  describe "GET /show" do
    context "when installment by Bill" do
      it "return successful" do
        get api_v1_payment_url(payment), as: :json

        expect(response).to be_successful
      end

      it "return all installment" do
        get api_v1_payment_url(payment), as: :json

        expect(body_json.payment.to_h.keys).to eq(%i[id pay_date accounting_date discount_amount interest_amount
                                                     increase_amount total_amount notary_value
                                                     protest_value charts_accounts_amount_paid_id
                                                     charts_accounts_discount_amount_id
                                                     charts_accounts_interest_amount_id charts_accounts_increase_amount_id
                                                     charts_accounts_notary_value_id charts_accounts_protest_value_id])
      end
    end
  end

  describe "POST /create payable" do
    context "with valid parameters" do
      it "creates a new Payment" do
        expect do
          post api_v1_payments_url,
               params: { payment: payable_valid_attributes }, as: :json
        end.to change(Payment, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_payment" do
        post api_v1_payments_url,
             params: { payment: payable_valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Payment" do
        expect do
          post api_v1_payments_url,
               params: { payment: invalid_attributes }, as: :json
        end.to change(Payment, :count).by(0)
      end

      it "renders a JSON response with errors for the new payment" do
        post api_v1_payments_url,
             params: { payment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "POST /create receivable" do
    context "with valid parameters" do
      it "creates a new Payment" do
        expect do
          post api_v1_payments_url,
               params: { payment: receivable_valid_attributes }, as: :json
        end.to change(Payment, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_payment" do
        post api_v1_payments_url,
             params: { payment: receivable_valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Payment" do
        expect do
          post api_v1_payments_url,
               params: { payment: invalid_attributes }, as: :json
        end.to change(Payment, :count).by(0)
      end

      it "renders a JSON response with errors for the new payment" do
        post api_v1_payments_url,
             params: { payment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /update" do
    let(:new_params) do
      {
        amount_paid: 9999.99,
        pay_date: "2021-11-14"
      }
    end

    context "with valid parameters" do
      it "check if payment fields is updated" do
        put api_v1_payment_url(payment),
            params: { payment: new_params }, as: :json
        expect(body_json.amount_paid).to eq(9999.99)
      end

      it "renders a JSON response" do
        put api_v1_payment_url(payment),
            params: { payment: new_params }, as: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid parameters" do
      it "not update when invalid attributes" do
        put api_v1_payment_url(payment),
            params: { payment: invalid_attributes }, as: :json

        expect(body_json.pay_date).to include("Data de Pagamento não pode ser maior que data atual")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested installment" do
      expect do
        delete api_v1_payment_url(payment), as: :json
      end.to change(Payment, :count).by(0)
    end
  end
end
