module Api
  module V1
    class InstallmentsController < ApplicationController
      def create
        @installment = Installment.new(installment_params)

        if @installment.save
          render json: @installment, status: :created
        else
          render json: @installment.errors, status: :unprocessable_entity
        end
      end

      private

      def installment_params
        params.require(:installment).permit(
          :name,
          :note,
          :due_date,
          :bill_id,
          :account_bank_id,
          :type_charge_id,
          :due_date,
          :value,
          :discount_due_date,
          :discount,
          :notary_title,
          :send_date,
          :notary_value,
          :protested_title,
          :protest_date,
          :protest_value,
          :bank_remittance
        )
      end
    end
  end
end
