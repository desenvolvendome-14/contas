module Api
  module V1
    class PaymentsController < ApplicationController
      before_action :set_payment, only: %i[update destroy]

      def create
        @payment = Payment.new(payment_params)

        if @payment.save
          render json: @payment, status: :created
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      def update
        if @payment.update(payment_params)
          render json: @payment, status: :ok
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @payment.destroy
        render json: {
          message: "Excluido"
        }, status: :ok
      end

      private

      def set_payment
        @payment = Payment.find(params[:id])
      end

      def payment_params
        params.require(:payment).permit(
          :pay_date, :accounting_date, :amount_paid,
          :discount_amount, :interest_amount, :increase_amount,
          :total_amount, :notary_value, :protest_value, :charts_accounts_amount_paid_id,
          :charts_accounts_discount_amount_id, :charts_accounts_interest_amount_id,
          :charts_accounts_increase_amount_id, :bill_id, :installment_id,
          :reason_bearish_id, :document_type_id, :account_bank_id,
          :charts_accounts_notary_value, :charts_accounts_protest_value
        )
      end
    end
  end
end
