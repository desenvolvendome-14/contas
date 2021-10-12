module Api
  module V1
    class DocumentTypesController < ApplicationController

      def index
        @document_types = DocumentType.all
      end
    end
  end
end
