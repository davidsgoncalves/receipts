class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :fixed_value_cd
      t.decimal :value
      t.integer :type_cd
      t.integer :installments
      t.integer :payday_limit
      t.integer :starts_at
      t.boolean :require_receipt
      t.boolean :require_doc
      t.boolean :late_fine
      t.text :obs

      t.timestamps
    end
  end
end
