require "rails_helper"

RSpec.describe "rateios", type: :request do
  #
  # let(:code_valid_attributes) { build(:code).attributes }
  # end

  describe "GET /index" do
    before :each do
      create_list(:rateio, 3)
    end
    it "renders a successful response" do
      get api_v1_rateios_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
      it "renders a successful response" do
        rateio = Rateio.create! valid_attributes
        get api_v1_rateio_url(api_v1_rateio), as: :json
        expect(response).to be_successful
      end
    end
  #
  #   describe "POST /create" do
  #     context "with valid parameters" do
  #       it "creates a new Rateio" do
  #         expect {
  #           post rateios_url,
  #                params: { rateio: valid_attributes }, headers: valid_headers, as: :json
  #         }.to change(Rateio, :count).by(1)
  #       end
  #
  #       it "renders a JSON response with the new api/v1_rateio" do
  #         post api_v1_rateios_url,
  #              params: { rateio: valid_attributes }, headers: valid_headers, as: :json
  #         expect(response).to have_http_status(:created)
  #         expect(response.content_type).to match(a_string_including("application/json"))
  #       end
  #     end
  #
  #     context "with invalid parameters" do
  #       it "does not create a new Api::V1::Rateio" do
  #         expect {
  #           post api_v1_rateios_url,
  #                params: { rateio: invalid_attributes }, as: :json
  #         }.to change(Rateio, :count).by(0)
  #       end
  #
  #       it "renders a JSON response with errors for the new api/v1_rateio" do
  #         post api_v1_rateios_url,
  #              params: { rateio: invalid_attributes }, headers: valid_headers, as: :json
  #         expect(response).to have_http_status(:unprocessable_entity)
  #         expect(response.content_type).to eq("application/json")
  #       end
  #     end
  #   end
  #
  #   describe "PATCH /update" do
  #     context "with valid parameters" do
  #       let(:new_attributes) {
  #         skip("Add a hash of attributes valid for your model")
  #       }
  #
  #       it "updates the requested api/v1_rateio" do
  #         rateio = Rateio.create! valid_attributes
  #         patch rateio_url(rateio),
  #               params: { rateio: new_attributes }, headers: valid_headers, as: :json
  #         rateio.reload
  #         skip("Add assertions for updated state")
  #       end
  #
  #       it "renders a JSON response with the api/v1_rateio" do
  #         rateio = Api::V1::Rateio.create! valid_attributes
  #         patch api_v1_rateio_url(api_v1_rateio),
  #               params: { api_v1_rateio: new_attributes }, headers: valid_headers, as: :json
  #         expect(response).to have_http_status(:ok)
  #         expect(response.content_type).to match(a_string_including("application/json"))
  #       end
  #     end
  #
  #     context "with invalid parameters" do
  #       it "renders a JSON response with errors for the api/v1_rateio" do
  #         rateio = Api::V1::Rateio.create! valid_attributes
  #         patch api_v1_rateio_url(api_v1_rateio),
  #               params: { api_v1_rateio: invalid_attributes }, headers: valid_headers, as: :json
  #         expect(response).to have_http_status(:unprocessable_entity)
  #         expect(response.content_type).to eq("application/json")
  #       end
  #     end
  #   end
  #
    describe "DELETE /destroy" do
      it "destroys the requested api/v1_rateio" do
        rateio = Api::V1::Rateio.create! valid_attributes
        expect {
          delete api_v1_rateio_url(api_v1_rateio), headers: valid_headers, as: :json
        }.to change(Api::V1::Rateio, :count).by(-1)
      end
  end
end
