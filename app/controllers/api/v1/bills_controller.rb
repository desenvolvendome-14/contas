class Api::V1::BillsController < ApplicationController
  before_action :set_bill, only: %i[ show update destroy ]

  def index
    if params[:bill_type].present?
      @bills = Bill.where(bill_type: params[:bill_type])
    else
      render json: {
        message: "Precisa enviar o campo bill_type, este campo pode ter os valores invoice_receivable, invoice_payable, expense_payable"
      }, status: :unprocessable_entity
    end
  end

  def show
  end

  def create_payable
    @bill = Bill.new(bill_payable_params)

    if @bill.save
      render :show, status: :created, location: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  def create_receivable
    @bill = Bill.new(bill_receivable_params)

    if @bill.save
      render :show, status: :created, location: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bill.destroy
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_receivable_params
    params.require(:bill).permit(
      :bill_type,
      :company_id,
      :invoice,
      :type_invoice,
      :issuance_date,
      :invoice_value,
      :increase,
      :salesman_id,
      :commission
    )
  end

  def bill_payable_params
    params.require(:bill).permit(
      :bill_type,
      :company_id,
      :invoice,
      :type_invoice,
      :issuance_date,
      :invoice_value,
      :increase,
      :scanning_date,
      :description,
      :account_plan_id,
      :cost_center_id,
      :discount,
      :net_value
    )
  end
end
