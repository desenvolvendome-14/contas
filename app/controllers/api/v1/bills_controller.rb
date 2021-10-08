# frozen_string_literal: true

module Api
  module V1
    class BillsController < ApplicationController
      before_action :set_bill, only: %i[show update_receivable update_payable destroy]

      def index
        if params[:bill_type].present?
          @bills = Bill.where(bill_type: params[:bill_type])
        else
          @bills = Bill.all
          render json: {
            bills: @bills,
            message: "Pode filtar por tipo de conta enviando o parametro `bill_type`,
                      como invoice_receivable ou invoice_payable ou expense_payable"
          }, status: :ok
        end
      end

      def show; end

      def create_payable
        @bill = Bill.new(bill_payable_params)

        if @bill.save
          render json: @bill, status: :created
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      def create_receivable
        @bill = Bill.new(bill_receivable_params)

        if @bill.save
          render json: @bill, status: :created
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      def update_receivable
        if @bill.update(bill_receivable_params)
          render @bill, status: :ok
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      def update_payable
        if @bill.update(bill_payable_params)
          render @bill, status: :ok
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @bill.destroy
          render json: {
            message: "Excluido"
          }, status: :ok
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      private

      def set_bill
        @bill = Bill.find(params[:id])
      end

      def bill_params
        params.require(:bill).permit(
          :bill_type,
          :company_id,
          :invoice,
          :type_invoice,
          :issuance_date,
          :invoice_value,
          :increase,
          :net_value
        )
      end

      def bill_receivable_params
        params.require(:bill).permit(
          :salesman_id,
          :commission
        ).merge(bill_params)
      end

      def bill_payable_params
        params.require(:bill).permit(
          :scanning_date,
          :description,
          :account_plan_id,
          :cost_center_id,
          :discount
        ).merge(bill_params)
      end
    end
  end
end
