module Api
  module V1
    class PaymentsController < ApplicationController
      def create
        @payment = Payment.new(payment_params)

        if @payment.save
          render json: @payment, status: :created
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      private

      def payment_params
        params.require(:payment).permit(
          :pay_date, :accounting_date, :amount_paid,
          :discount_amount, :interest_amount, :increase_amount,
          :total_amount, :charts_accounts_amount_paid_id,
          :charts_accounts_discount_amount_id, :charts_accounts_interest_amount_id,
          :charts_accounts_increase_amount_id, :bill_id, :installment_id,
          :reason_bearish_id, :document_type_id, :account_bank_id
        )
      end
    end
  end
end
