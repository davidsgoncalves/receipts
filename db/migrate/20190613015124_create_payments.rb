class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.boolean :paid, default: false
      t.date :payday
      t.decimal :estimated_value
      t.decimal :paid_value
      t.string :receipt
      t.string :bill_image

      t.belongs_to :bill
      t.timestamps
    end
  end
end
