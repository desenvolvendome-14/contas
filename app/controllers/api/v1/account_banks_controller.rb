class Api::V1::AccountBanksController < ApplicationController
  def index
    @account_banks = AccountBank.all
  end
end
