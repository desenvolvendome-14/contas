# frozen_string_literal: true

module Api
  module V1
    class RateiosController < ApplicationController
      before_action :set_rateio, only: %i[show update destroy]

      # GET /api/v1/rateios
      # GET /api/v1/rateios.json
      def index
        @rateios = Rateio.all
      end
      # GET /api/v1/rateios/1
      # GET /api/v1/rateios/1.json
      def show; end
      #   # POST /api/v1/rateios
      #   # POST /api/v1/rateios.json
      def create
        @rateio = Rateio.new(rateio_params)
        if @rateio.save
          render :show, status: :created, location: @rateio
        else
          render json: @rateio.errors, status: :unprocessable_entity
        end
      end
      #
      #   # PATCH/PUT /api/v1/rateios/1
      #   # PATCH/PUT /api/v1/rateios/1.json
      #   def update
      #     if @api_v1_rateio.update(api_v1_rateio_params)
      #       render :show, status: :ok, location: @api_v1_rateio
      #     else
      #       render json: @api_v1_rateio.errors, status: :unprocessable_entity
      #     end
      #   end
      #
      #   # DELETE /api/v1/rateios/1
      #   # DELETE /api/v1/rateios/1.json
      def destroy
        @rateio.destroy
      end

      private

      #   # Use callbacks to share common setup or constraints between actions.
      def set_rateio
        @rateio = Rateio.find(params[:id])
      end
      #   # Only allow a list of trusted parameters through.
      def rateio_params
        params.require(:rateio).permit(:id, :code, :story, :value)
      end
    end
  end
end
