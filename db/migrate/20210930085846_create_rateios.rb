class CreateRateios < ActiveRecord::Migration[6.1]
  def change
    create_table :rateios do |t|
      t.string :code
      t.references :account_plan, null: false, foreign_key: true
      t.references :cost_center, null: false, foreign_key: true
      t.string :story
      t.references :bio_id, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
