# == Schema Information
#
# Table name: reason_bearishes
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ReasonBearish < ApplicationRecord
    validates :description, presence: true
    
end
