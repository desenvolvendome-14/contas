module Api
  module V1
    class ReasonBearishesController < ApplicationController
      def index
        @reason_bearishes = ReasonBearish.all
      end
    end
  end
end
