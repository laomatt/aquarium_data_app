class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :tank
      t.text :content
      t.string :title

      t.timestamps null: false
    end
  end
end
