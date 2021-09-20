# frozen_string_literal: true

class CreateReasonBearishes < ActiveRecord::Migration[6.1]
  def change
    create_table :reason_bearishes do |t|
      t.string :description

      t.timestamps
    end
  end
end
