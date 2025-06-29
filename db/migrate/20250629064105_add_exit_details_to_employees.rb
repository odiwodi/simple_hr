class AddExitDetailsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :resignation_letter_date, :date
    add_column :employees, :relieving_date, :date
    add_column :employees, :exit_interview_date, :date
    add_column :employees, :new_workplace, :string
    add_column :employees, :leave_encashed, :boolean
    add_column :employees, :reason_for_leaving, :text
    add_column :employees, :feedback, :text
  end
end
