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

        def destroy
          @rateio.destroy
        end
      #
      private
      # #
      # #   # Use callbacks to share common setup or constraints between actions.
        def set_rateio
          @rateios = Rateio.find(params[:id])
        end
      # #
      # #   # Only allow a list of trusted parameters through.
        def rateio_params
          params.fetch(:rateio, {})
        end
    end
  end
end
