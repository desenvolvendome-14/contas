class AccountBank < ApplicationRecord 
    validates :description, presence: true 
end
