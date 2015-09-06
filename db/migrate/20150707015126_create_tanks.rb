class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :name
      t.integer :gallons_size


      t.timestamps null: false
    end
  end
end
