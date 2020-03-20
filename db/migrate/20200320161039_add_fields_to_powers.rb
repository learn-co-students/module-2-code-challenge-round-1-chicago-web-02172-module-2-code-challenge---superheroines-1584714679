class AddFieldsToPowers < ActiveRecord::Migration[5.1]
  def change
    add_column :powers, :heroine_id, :integer
  end
end
