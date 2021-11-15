module Api
  module V1
    class CostCenterController < ApplicationController
      before_action :set_cost_center, only: %i[show update destroy]
      def index
        @cost_center = CostCenter.all
      end
    end
  end
end
