class CreateRateios < ActiveRecord::Migration[6.1]
  def change
    create_table :rateios do |t|
      t.decimal :value_rateio
      t.text :obs

      t.timestamps
    end
  end
end
