class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user
      t.references :entry
      t.text :content

      t.timestamps null: false
    end
  end
end
