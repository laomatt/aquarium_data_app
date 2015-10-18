class RemoveTankIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :tank_id
  end
end
