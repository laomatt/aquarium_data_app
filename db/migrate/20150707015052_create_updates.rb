class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :tank
      t.float :temp
      t.float :amonia
      t.float :nitrate
      t.float :nitrite

      t.timestamps null: false
    end
  end
end
