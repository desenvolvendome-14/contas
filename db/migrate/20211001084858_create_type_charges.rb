class CreateTypeCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :type_charges do |t|
      t.string :description

      t.timestamps
    end
  end
end
