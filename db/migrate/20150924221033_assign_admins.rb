class AssignAdmins < ActiveRecord::Migration
  def change
    User.find(1).update_attributes('admin' => true)
    User.find(54).update_attributes('admin' => true)
  end
end
