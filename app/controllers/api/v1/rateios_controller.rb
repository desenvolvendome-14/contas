module Api
  module V1
    class RateiosController < ApplicationController
      before_action :set_rateio, only: %i[ show update destroy ]

      # GET /api/v1/rateios
      # GET /api/v1/rateios.json
      def index
        @api_v1_rateios = Rateio.all
      end

      # GET /api/v1/rateios/1
      # GET /api/v1/rateios/1.json
      def show
      end

      # POST /api/v1/rateios
      # POST /api/v1/rateios.json
      def create
        @api_v1_rateio = Api::V1::Rateio.new(api_v1_rateio_params)

        if @api_v1_rateio.save
          render :show, status: :created, location: @api_v1_rateio
        else
          render json: @api_v1_rateio.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/rateios/1
      # PATCH/PUT /api/v1/rateios/1.json
      def update
        if @api_v1_rateio.update(api_v1_rateio_params)
          render :show, status: :ok, location: @api_v1_rateio
        else
          render json: @api_v1_rateio.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/rateios/1
      # DELETE /api/v1/rateios/1.json
      def destroy
        @api_v1_rateio.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_api_v1_rateio
          @api_v1_rateio = Api::V1::Rateio.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def api_v1_rateio_params
          params.fetch(:api_v1_rateio, {})
        end
    end
  end
end
