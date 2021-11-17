module Api
  module V1
    class TypeChargesController < ApplicationController
      def index
        @type_charges = TypeCharge.all
      end
    end
  end
end
