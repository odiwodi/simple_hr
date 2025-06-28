class AddAttendanceFieldsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :assigned_shift, null: true, foreign_key: { to_table: :shifts }
    add_column :employees, :attendance_device_id, :string
    add_column :employees, :is_overtime_eligible, :boolean, null: false, default: false
    add_reference :employees, :leave_approver, null: true, foreign_key: { to_table: :employees }
  end
end
