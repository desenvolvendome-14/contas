module Api
  module V1
    class TypeChargeController < ApplicationController
      before_action :set_typeCharge, only: %i[show update destroy]
      def index
        @type_charge = TypeCharge.all
      end
    end
  end
end
