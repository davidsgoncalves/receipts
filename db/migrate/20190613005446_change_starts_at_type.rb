class ChangeStartsAtType < ActiveRecord::Migration[5.2]
  def change
    remove_column :bills, :starts_at, :integer
    add_column :bills, :starts_at, :date
  end
end
