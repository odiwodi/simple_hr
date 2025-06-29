class ChangeEmployeeDefaultIsDeletedFlag < ActiveRecord::Migration[7.1]
  def change
    change_column_default :employees, :is_deleted, from: true, to: false
  end
end
