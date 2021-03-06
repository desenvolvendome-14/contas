# frozen_string_literal: true

require "rails_helper"

RSpec.describe Participant, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :person_type }
  end

  describe "::Associations" do
    it { should have_many(:bills) }
  end
end
