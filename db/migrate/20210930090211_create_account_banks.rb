class CreateAccountBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :account_banks do |t|
      t.string :description

      t.timestamps
    end
  end
end
