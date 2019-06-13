class AddPaidToBill < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :paid, :boolean, default: false
  end
end
