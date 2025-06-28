ActiveAdmin.register EmployeeGrade do
  menu label: "Grade", parent: "Configuration"
  permit_params :name, :job_level_id

  index do
    selectable_column
    id_column
    column :name
    column "Job Level" do |employee_grade|
      employee_grade.job_level&.position_name
    end
    column :created_at
    column :updated_at
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :job_level_id, as: :select, collection: JobLevel.all.map { |jl| [jl.position_name, jl.id] }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :job_level do |employee_grade|
        employee_grade.job_level&.position_name
      end
      row :created_at
      row :updated_at
    end
  end
end
