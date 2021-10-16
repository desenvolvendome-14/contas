class DocumentType < ApplicationRecord
  validates :description, presence: true
end
