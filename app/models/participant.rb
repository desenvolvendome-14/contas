class Participant < ApplicationRecord
  enum person_type: [:company, :salesman, :client]
  validates :name, :person_type, presence: true
end
