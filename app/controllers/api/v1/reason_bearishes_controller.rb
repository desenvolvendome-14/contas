class Api::V1::ReasonBearishesController < ApplicationController
  def index
    @reason_bearishes = ReasonBearish.all
  end
end
