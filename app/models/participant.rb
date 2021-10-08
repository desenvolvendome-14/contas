class Participant < ApplicationRecord
  has_many :bills
  enum person_type: [:company, :salesman, :client]
  validates :name, :person_type, presence: true
end
