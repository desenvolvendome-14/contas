# frozen_string_literal: true

class CreateAccountPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :account_plans do |t|
      t.string :description

      t.timestamps
    end
  end
end
