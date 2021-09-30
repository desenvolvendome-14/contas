class Participant < ApplicationRecord
  enum type: [:company, :salesman, :client]
  validates :name, :type, presence: true
end
