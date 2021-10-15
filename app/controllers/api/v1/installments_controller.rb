class Api::V1::InstallmentsController < ApplicationController
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
        :bill_id, 
        :account_bank_id, 
        :type_charge_id, 
        :due_date,
        :value
      )
    end
end
