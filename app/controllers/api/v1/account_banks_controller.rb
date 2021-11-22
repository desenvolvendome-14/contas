module Api
  module V1
    class AccountBanksController < ApplicationController
      def index
        @account_banks = AccountBank.all
      end
    end
  end
end
