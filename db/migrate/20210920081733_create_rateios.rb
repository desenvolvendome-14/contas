class CreateRateios < ActiveRecord::Migration[6.1]
  def change
    create_table :rateios do |t|
      t.string :code
      t.string :account_plan
      t.string :cost_center
      t.decimal :value
      t.string :story

      t.timestamps
    end
  end
end
