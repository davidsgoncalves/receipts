class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :name
      t.decimal :value
      t.integer :installments
      t.boolean :perpetual
      t.string :receipt
      t.boolean :paid
      t.string :doc
      t.date :pay_day

      t.timestamps
    end
  end
end
