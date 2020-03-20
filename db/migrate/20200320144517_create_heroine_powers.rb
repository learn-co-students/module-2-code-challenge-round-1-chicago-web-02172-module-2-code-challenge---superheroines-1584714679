class CreateHeroinePowers < ActiveRecord::Migration[5.1]
  def change
    create_table :heroine_powers do |t|
      t.belongs_to :heroine, foreign_key: true
      t.belongs_to :power, foreign_key: true

      t.timestamps
    end
  end
end
