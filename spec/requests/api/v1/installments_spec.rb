require 'rails_helper'


RSpec.describe "/api/v1/installments", type: :request do
  
  let(:valid_attributes) { build(:installment).attributes }

  let(:invalid_attributes) do
    {
    bill: "", 
    account_bank: "", 
    type_charge: "", 
    due_date: ""
    }
  end



  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Api::V1::Installment" do
        expect {
          post api_v1_installments_url,
              params: { installment: valid_attributes },as: :json
        }.to change(Installment, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_installment" do
        post api_v1_installments_url,
            params: { installment: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Api::V1::Installment" do
        expect {
          post api_v1_installments_url,
              params: { installment: invalid_attributes }, as: :json
        }.to change(Installment, :count).by(0)
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
